<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Display the user's analytics dashboard.
     */
    public function dashboard(Request $request): View
    {
        $user = $request->user();

        // Get overall statistics
        $totalAttempts = \App\Models\QuizAttempt::where('user_id', $user->id)->count();
        $correctAnswers = \App\Models\QuizAttempt::where('user_id', $user->id)->where('is_correct', true)->count();
        $incorrectAnswers = $totalAttempts - $correctAnswers;
        $accuracy = $totalAttempts > 0 ? round(($correctAnswers / $totalAttempts) * 100, 2) : 0;

        // Get subject-wise statistics
        $subjectStats = \App\Models\QuizAttempt::select(
            'subject_id',
            \DB::raw('COUNT(*) as total_attempts'),
            \DB::raw('SUM(is_correct) as correct_count'),
            \DB::raw('COUNT(*) - SUM(is_correct) as incorrect_count')
        )
            ->where('user_id', $user->id)
            ->groupBy('subject_id')
            ->with('subject')
            ->get()
            ->map(function ($stat) {
                $stat->accuracy = $stat->total_attempts > 0
                    ? round(($stat->correct_count / $stat->total_attempts) * 100, 2)
                    : 0;
                return $stat;
            });

        // Get recent quiz history (last 10)
        $recentAttempts = \App\Models\QuizAttempt::with(['subject', 'question'])
            ->where('user_id', $user->id)
            ->latest()
            ->take(10)
            ->get();

        return view('profile.dashboard', compact(
            'user',
            'totalAttempts',
            'correctAnswers',
            'incorrectAnswers',
            'accuracy',
            'subjectStats',
            'recentAttempts'
        ));
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
}
