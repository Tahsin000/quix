<?php

namespace App\Http\Controllers;

use App\Models\Subject;
use App\Models\QuizAttempt;
use Illuminate\Support\Facades\DB;

class SubjectController extends Controller
{
    public function index()
    {
        $subjects = Subject::active()
            ->withCount([
                'questions' => function ($query) {
                    $query->where('is_active', true);
                }
            ])
            ->get();

        // Get user's best scores per subject
        $userScores = QuizAttempt::select('subject_id', DB::raw('COUNT(*) as total'), DB::raw('SUM(is_correct) as correct'))
            ->where('user_id', auth()->id())
            ->groupBy('subject_id')
            ->get()
            ->keyBy('subject_id');

        return view('subjects.index', compact('subjects', 'userScores'));
    }
}
