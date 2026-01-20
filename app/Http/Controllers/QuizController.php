<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Models\QuizAttempt;
use App\Models\Subject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QuizController extends Controller
{
    public function show(Request $request, $subjectId)
    {
        $subject = Subject::with([
            'questions' => function ($query) {
                $query->active()->inRandomOrder();
            }
        ])->findOrFail($subjectId);

        if ($subject->questions->isEmpty()) {
            return redirect()->route('dashboard')
                ->with('error', 'No questions available for this subject yet.');
        }

        // Get question count from request or session, but cap it at available questions
        $availableQuestions = $subject->questions->count();
        $requestedCount = $request->input('count', session('quiz_question_count', 10));
        $questionCount = min($requestedCount, $availableQuestions);

        // If requested count is higher than available, show info message
        if ($requestedCount > $availableQuestions) {
            session()->flash('info', "Only {$availableQuestions} questions available for this subject. Quiz adjusted accordingly.");
        }

        // Check if this is a new quiz session (has count parameter or different subject)
        $isNewQuiz = $request->has('count') || session('current_subject_id') != $subjectId;
        
        // If starting a new quiz, clear the session for this subject
        if ($isNewQuiz) {
            // Clear previous quiz attempts for fresh start
            QuizAttempt::where('user_id', auth()->id())
                ->where('subject_id', $subjectId)
                ->delete();
            
            // Reset session
            session()->forget(['quiz_start_time', 'quiz_answered_in_session']);
        }

        // Get already answered questions in current session only
        $sessionAnswered = session('quiz_answered_in_session', []);
        
        $question = Question::where('subject_id', $subjectId)
            ->active()
            ->whereNotIn('id', $sessionAnswered)
            ->inRandomOrder()
            ->first();

        if (!$question) {
            return redirect()->route('dashboard')
                ->with('error', 'No questions available for this subject yet.');
        }

        // Get user's current session answered count
        $answeredCount = count($sessionAnswered);

        // Store quiz start time and settings
        if (!session()->has('quiz_start_time')) {
            session(['quiz_start_time' => microtime(true)]);
        }
        session([
            'current_subject_id' => $subjectId,
            'quiz_question_count' => $questionCount,
            'quiz_available_questions' => $availableQuestions
        ]);

        return view('quiz.show', compact('subject', 'question', 'answeredCount', 'questionCount'));
    }

    public function answer(Request $request)
    {
        $question = Question::findOrFail($request->question_id);
        $selectedAnswer = $request->selected_answer;
        $isCorrect = $selectedAnswer === $question->correct_answer;

        // Record the attempt
        QuizAttempt::create([
            'user_id' => auth()->id(),
            'subject_id' => $question->subject_id,
            'question_id' => $question->id,
            'selected_answer' => $selectedAnswer,
            'is_correct' => $isCorrect,
        ]);

        // Track answered questions in session
        $answeredInSession = session('quiz_answered_in_session', []);
        $answeredInSession[] = $question->id;
        session(['quiz_answered_in_session' => $answeredInSession]);

        // Check if we've reached the limit
        $questionCount = session('quiz_question_count', 10);
        $availableQuestions = session('quiz_available_questions', 10);
        $hasReachedLimit = count($answeredInSession) >= $questionCount || count($answeredInSession) >= $availableQuestions;

        $nextQuestion = null;
        if (!$hasReachedLimit) {
            $nextQuestion = Question::where('subject_id', $question->subject_id)
                ->active()
                ->whereNotIn('id', $answeredInSession)
                ->inRandomOrder()
                ->first();
        }

        return response()->json([
            'is_correct' => $isCorrect,
            'correct_answer' => $question->correct_answer,
            'correct_answer_text' => $question->{'option_' . $question->correct_answer},
            'explanation' => 'The correct answer is: ' . strtoupper($question->correct_answer),
            'has_next' => $nextQuestion ? true : false,
            'next_question_id' => $nextQuestion?->id,
        ]);
    }

    public function nextQuestion(Request $request, $subjectId)
    {
        $questionCount = session('quiz_question_count', 10);
        $availableQuestions = session('quiz_available_questions', 10);

        // Get already answered questions in this session
        $answeredInSession = session('quiz_answered_in_session', []);

        // Check if we've reached the question limit or answered all available questions
        if (count($answeredInSession) >= $questionCount || count($answeredInSession) >= $availableQuestions) {
            return redirect()->route('quiz.results', $subjectId);
        }

        $question = Question::where('subject_id', $subjectId)
            ->active()
            ->whereNotIn('id', $answeredInSession)
            ->inRandomOrder()
            ->first();

        if (!$question) {
            return redirect()->route('quiz.results', $subjectId);
        }

        $subject = Subject::find($subjectId);
        $answeredCount = count($answeredInSession);

        return view('quiz.show', compact('subject', 'question', 'answeredCount', 'questionCount'));
    }

    public function results($subjectId)
    {
        $subject = Subject::findOrFail($subjectId);

        // Get answered questions from session
        $answeredInSession = session('quiz_answered_in_session', []);
        
        // Get attempts for this quiz session only
        $attempts = QuizAttempt::where('user_id', auth()->id())
            ->where('subject_id', $subjectId)
            ->whereIn('question_id', $answeredInSession)
            ->get();

        $totalQuestions = $attempts->count();
        $correctAnswers = $attempts->where('is_correct', true)->count();
        $incorrectAnswers = $totalQuestions - $correctAnswers;
        $percentage = $totalQuestions > 0 ? round(($correctAnswers / $totalQuestions) * 100, 2) : 0;

        // Calculate time taken in seconds with 2 decimal places
        $startTime = session('quiz_start_time');
        $timeTaken = $startTime ? round(microtime(true) - $startTime, 2) : 0;

        // Clear session
        session()->forget(['quiz_start_time', 'current_subject_id', 'quiz_question_count', 'quiz_answered_in_session', 'quiz_available_questions']);

        return view('quiz.results', compact(
            'subject',
            'totalQuestions',
            'correctAnswers',
            'incorrectAnswers',
            'percentage',
            'timeTaken'
        ));
    }
}
