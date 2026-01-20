<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect()->route('login');
});

Route::middleware(['auth', 'verified'])->group(function () {
    // Routes for regular users only (quiz taking)
    Route::middleware(['role.user'])->group(function () {
        Route::get('/dashboard', [App\Http\Controllers\SubjectController::class, 'index'])
            ->name('dashboard');

        // Subject routes
        Route::get('/subjects', [App\Http\Controllers\SubjectController::class, 'index'])
            ->name('subjects.index');

        // Quiz routes
        Route::get('/quiz/{subject}', [App\Http\Controllers\QuizController::class, 'show'])
            ->name('quiz.show');
        Route::post('/quiz/answer', [App\Http\Controllers\QuizController::class, 'answer'])
            ->name('quiz.answer');
        Route::get('/quiz/{subject}/next', [App\Http\Controllers\QuizController::class, 'nextQuestion'])
            ->name('quiz.next');
        Route::get('/quiz/{subject}/results', [App\Http\Controllers\QuizController::class, 'results'])
            ->name('quiz.results');

        // Quiz Request routes
        Route::get('/quiz-requests', [App\Http\Controllers\QuizRequestController::class, 'index'])
            ->name('quiz-requests.index');
        Route::get('/quiz-requests/create', [App\Http\Controllers\QuizRequestController::class, 'create'])
            ->name('quiz-requests.create');
        Route::post('/quiz-requests', [App\Http\Controllers\QuizRequestController::class, 'store'])
            ->name('quiz-requests.store');
        Route::post('/quiz-requests/bulk', [App\Http\Controllers\QuizRequestController::class, 'storeBulk'])
            ->name('quiz-requests.store-bulk');

        // Profile analytics
        Route::get('/my-stats', [App\Http\Controllers\ProfileController::class, 'dashboard'])
            ->name('profile.dashboard');
    });

    // Profile routes (accessible to all authenticated users)
    Route::get('/profile', [App\Http\Controllers\ProfileController::class, 'edit'])
        ->name('profile.edit');
    Route::patch('/profile', [App\Http\Controllers\ProfileController::class, 'update'])
        ->name('profile.update');
    Route::delete('/profile', [App\Http\Controllers\ProfileController::class, 'destroy'])
        ->name('profile.destroy');
});

require __DIR__ . '/auth.php';
