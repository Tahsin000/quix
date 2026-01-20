<x-app-layout>
    <div class="min-h-screen bg-gradient-to-br from-emerald-50 to-green-100 flex items-center justify-center px-4 py-8">
        <div class="max-w-2xl w-full">
            <!-- Results Card -->
            <div class="bg-white rounded-2xl shadow-2xl overflow-hidden">
                <!-- Header with Animation -->
                <div class="relative bg-gradient-to-r from-emerald-600 to-green-700 text-white p-8 text-center">
                    <div class="mb-4">
                        @if($percentage >= 80)
                            <div class="text-6xl mb-2">🏆</div>
                            <h2 class="text-3xl font-bold">Excellent!</h2>
                        @elseif($percentage >= 60)
                            <div class="text-6xl mb-2">🌟</div>
                            <h2 class="text-3xl font-bold">Great Job!</h2>
                        @else
                            <div class="text-6xl mb-2">📚</div>
                            <h2 class="text-3xl font-bold">Keep Learning!</h2>
                        @endif
                    </div>
                    <p class="text-xl opacity-90">{{ $subject->name }} Quiz Completed</p>
                </div>

                <!-- Score Display -->
                <div class="p-8">
                    <div class="text-center mb-8">
                        <div class="inline-block">
                            <div class="text-6xl font-bold text-emerald-600 mb-2">{{ $percentage }}%</div>
                            <p class="text-gray-600">Your Score</p>
                        </div>
                    </div>

                    <!-- Statistics Grid -->
                    <div class="grid grid-cols-3 gap-4 mb-8">
                        <div class="bg-emerald-50 rounded-xl p-4 text-center">
                            <div class="text-3xl font-bold text-emerald-600">{{ $totalQuestions }}</div>
                            <p class="text-sm text-gray-600 mt-1">Total</p>
                        </div>
                        <div class="bg-green-50 rounded-xl p-4 text-center">
                            <div class="text-3xl font-bold text-green-600">{{ $correctAnswers }}</div>
                            <p class="text-sm text-gray-600 mt-1">Correct</p>
                        </div>
                        <div class="bg-red-50 rounded-xl p-4 text-center">
                            <div class="text-3xl font-bold text-red-600">{{ $incorrectAnswers }}</div>
                            <p class="text-sm text-gray-600 mt-1">Wrong</p>
                        </div>
                    </div>

                    <!-- Time Taken -->
                    <div class="bg-gray-50 rounded-xl p-4 mb-8 text-center">
                        <div class="flex items-center justify-center">
                            <svg class="w-5 h-5 text-gray-600 mr-2" fill="none" stroke="currentColor"
                                viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                            <span class="text-gray-700">Time Taken: <strong>{{ $timeTaken }} minutes</strong></span>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="space-y-3">
                        <a href="{{ route('quiz.show', $subject->id) }}"
                            class="block w-full bg-emerald-600 text-white text-center px-6 py-4 rounded-xl hover:bg-emerald-700 transition font-bold text-lg">
                            Try Again
                        </a>
                        <a href="{{ route('dashboard') }}"
                            class="block w-full bg-gray-600 text-white text-center px-6 py-4 rounded-xl hover:bg-gray-700 transition font-bold text-lg">
                            Choose Another Subject
                        </a>
                        <a href="{{ route('profile.dashboard') }}"
                            class="block w-full bg-emerald-600 text-white text-center px-6 py-4 rounded-xl hover:bg-emerald-700 transition font-bold text-lg">
                            View My Stats
                        </a>
                    </div>
                </div>
            </div>

            <!-- Motivational Message -->
            <div class="text-center mt-6 text-gray-600">
                @if($percentage >= 80)
                    <p>Outstanding performance! You're mastering this subject! 🎓</p>
                @elseif($percentage >= 60)
                    <p>Good work! Keep practicing to improve further! 💪</p>
                @else
                    <p>Don't give up! Practice makes perfect! 📖</p>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>
