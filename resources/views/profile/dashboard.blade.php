<x-app-layout>
    <div class="min-h-screen bg-gradient-to-br from-emerald-50 to-green-100 py-8 px-4">
        <div class="max-w-6xl mx-auto">
            <!-- Header -->
            <div class="mb-8">
                <a href="{{ route('dashboard') }}" class="text-emerald-600 hover:text-blue-800 flex items-center mb-4">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    Back to Dashboard
                </a>
                <h1 class="text-3xl font-bold text-gray-900">My Statistics</h1>
                <p class="text-gray-600 mt-2">Track your quiz performance and progress</p>
            </div>

            <!-- Overall Statistics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-8">
                <div class="bg-white rounded-xl shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600 mb-1">Total Attempts</p>
                            <p class="text-3xl font-bold text-emerald-600">{{ $totalAttempts }}</p>
                        </div>
                        <div class="w-12 h-12 bg-emerald-100 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-emerald-600" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                                <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd" />
                            </svg>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-xl shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600 mb-1">Correct Answers</p>
                            <p class="text-3xl font-bold text-green-600">{{ $correctAnswers }}</p>
                        </div>
                        <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-green-600" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                            </svg>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-xl shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600 mb-1">Incorrect Answers</p>
                            <p class="text-3xl font-bold text-red-600">{{ $incorrectAnswers }}</p>
                        </div>
                        <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-red-600" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                            </svg>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-xl shadow-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600 mb-1">Accuracy Rate</p>
                            <p class="text-3xl font-bold text-purple-600">{{ $accuracy }}%</p>
                        </div>
                        <div class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-purple-600" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2 11a1 1 0 011-1h2a1 1 0 011 1v5a1 1 0 01-1 1H3a1 1 0 01-1-1v-5zM8 7a1 1 0 011-1h2a1 1 0 011 1v9a1 1 0 01-1 1H9a1 1 0 01-1-1V7zM14 4a1 1 0 011-1h2a1 1 0 011 1v12a1 1 0 01-1 1h-2a1 1 0 01-1-1V4z" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Subject-wise Performance -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden mb-8">
                <div class="px-6 py-4 bg-gradient-to-r from-emerald-600 to-green-700">
                    <h2 class="text-xl font-bold text-white">Performance by Subject</h2>
                </div>
                <div class="p-6">
                    @if($subjectStats->isEmpty())
                        <p class="text-center text-gray-500 py-8">No quiz data yet. Start taking quizzes to see your statistics!</p>
                    @else
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead>
                                    <tr class="border-b-2 border-gray-200">
                                        <th class="text-left py-3 px-4 font-semibold text-gray-700">Subject</th>
                                        <th class="text-center py-3 px-4 font-semibold text-gray-700">Total</th>
                                        <th class="text-center py-3 px-4 font-semibold text-gray-700">Correct</th>
                                        <th class="text-center py-3 px-4 font-semibold text-gray-700">Wrong</th>
                                        <th class="text-center py-3 px-4 font-semibold text-gray-700">Accuracy</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($subjectStats as $stat)
                                        <tr class="border-b border-gray-100 hover:bg-gray-50">
                                            <td class="py-4 px-4 font-medium">{{ $stat->subject->name }}</td>
                                            <td class="py-4 px-4 text-center">{{ $stat->total_attempts }}</td>
                                            <td class="py-4 px-4 text-center text-green-600 font-semibold">{{ $stat->correct_count }}</td>
                                            <td class="py-4 px-4 text-center text-red-600 font-semibold">{{ $stat->incorrect_count }}</td>
                                            <td class="py-4 px-4 text-center">
                                                <span class="inline-block px-3 py-1 rounded-full text-sm font-semibold
                                                    {{ $stat->accuracy >= 80 ? 'bg-green-100 text-green-800' : ($stat->accuracy >= 60 ? 'bg-yellow-100 text-yellow-800' : 'bg-red-100 text-red-800') }}">
                                                    {{ $stat->accuracy }}%
                                                </span>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @endif
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <div class="px-6 py-4 bg-gradient-to-r from-emerald-600 to-green-600">
                    <h2 class="text-xl font-bold text-white">Recent Quiz Activity</h2>
                </div>
                <div class="p-6">
                    @if($recentAttempts->isEmpty())
                        <p class="text-center text-gray-500 py-8">No recent activity</p>
                    @else
                        <div class="space-y-3">
                            @foreach($recentAttempts->take(10) as $attempt)
                                <div class="flex items-center justify-between p-4 rounded-lg {{ $attempt->is_correct ? 'bg-green-50 border border-green-200' : 'bg-red-50 border border-red-200' }}">
                                    <div class="flex-1">
                                        <p class="font-medium text-gray-900">{{ $attempt->subject->name }}</p>
                                        <p class="text-sm text-gray-600 line-clamp-1">{{ $attempt->question->question_text }}</p>
                                    </div>
                                    <div class="ml-4">
                                        @if($attempt->is_correct)
                                            <span class="inline-flex items-center px-3 py-1 bg-green-100 text-green-800 rounded-full text-sm font-semibold">
                                                <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                                                </svg>
                                                Correct
                                            </span>
                                        @else
                                            <span class="inline-flex items-center px-3 py-1 bg-red-100 text-red-800 rounded-full text-sm font-semibold">
                                                <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                                                </svg>
                                                Wrong
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </div>
            </div>

            <!-- Back to Dashboard Button -->
            <div class="mt-8 text-center">
                <a href="{{ route('dashboard') }}" 
                   class="inline-block bg-emerald-600 text-white px-8 py-3 rounded-xl hover:bg-emerald-700 transition font-semibold">
                    Continue Taking Quizzes
                </a>
            </div>
        </div>
    </div>
</x-app-layout>
