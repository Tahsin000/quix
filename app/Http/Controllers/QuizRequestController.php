<?php

namespace App\Http\Controllers;

use App\Models\QuizRequest;
use App\Models\Subject;
use Illuminate\Http\Request;

class QuizRequestController extends Controller
{
    public function create()
    {
        $subjects = Subject::active()->get();
        return view('quiz-requests.create', compact('subjects'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'subject_id' => 'required|exists:subjects,id',
            'question_text' => 'required|string',
            'option_a' => 'required|string|max:255',
            'option_b' => 'required|string|max:255',
            'option_c' => 'required|string|max:255',
            'option_d' => 'required|string|max:255',
            'correct_answer' => 'required|in:a,b,c,d',
        ]);

        QuizRequest::create([
            ...$validated,
            'user_id' => auth()->id(),
            'status' => 'pending',
        ]);

        return redirect()->route('quiz-requests.index')
            ->with('success', 'Your quiz request has been submitted for review!');
    }

    public function index()
    {
        $requests = QuizRequest::with('subject')
            ->where('user_id', auth()->id())
            ->latest()
            ->get();

        return view('quiz-requests.index', compact('requests'));
    }

    public function storeBulk(Request $request)
    {
        $validated = $request->validate([
            'json_data' => 'required|json',
        ]);

        try {
            $quizData = json_decode($validated['json_data'], true);

            if (!is_array($quizData)) {
                return back()->withErrors(['json_data' => 'Invalid JSON format. Must be an array of quiz questions.']);
            }

            $created = 0;
            $errors = [];

            foreach ($quizData as $index => $quiz) {
                try {
                    // Validate each quiz entry
                    $validator = validator($quiz, [
                        'subject_id' => 'required|exists:subjects,id',
                        'question_text' => 'required|string',
                        'option_a' => 'required|string|max:255',
                        'option_b' => 'required|string|max:255',
                        'option_c' => 'required|string|max:255',
                        'option_d' => 'required|string|max:255',
                        'correct_answer' => 'required|in:a,b,c,d',
                    ]);

                    if ($validator->fails()) {
                        $errors[] = "Quiz #" . ($index + 1) . ": " . implode(', ', $validator->errors()->all());
                        continue;
                    }

                    QuizRequest::create([
                        'user_id' => auth()->id(),
                        'subject_id' => $quiz['subject_id'],
                        'question_text' => $quiz['question_text'],
                        'option_a' => $quiz['option_a'],
                        'option_b' => $quiz['option_b'],
                        'option_c' => $quiz['option_c'],
                        'option_d' => $quiz['option_d'],
                        'correct_answer' => $quiz['correct_answer'],
                        'status' => 'pending',
                    ]);

                    $created++;
                } catch (\Exception $e) {
                    $errors[] = "Quiz #" . ($index + 1) . ": " . $e->getMessage();
                }
            }

            if ($created > 0) {
                $message = "{$created} quiz request(s) submitted successfully!";
                if (count($errors) > 0) {
                    $message .= " " . count($errors) . " failed: " . implode('; ', $errors);
                }
                return redirect()->route('quiz-requests.index')->with('success', $message);
            } else {
                return back()->withErrors(['json_data' => 'No valid quiz questions found. Errors: ' . implode('; ', $errors)]);
            }
        } catch (\Exception $e) {
            return back()->withErrors(['json_data' => 'Error processing JSON: ' . $e->getMessage()]);
        }
    }
}
