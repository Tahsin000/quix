<x-app-layout>
    <div class="min-h-screen bg-gradient-to-br from-emerald-50 to-green-100"
        x-data="{ 
            showModal: false, 
            selectedSubject: null, 
            questionCount: 10, 
            maxQuestions: 20,
            setQuestionCount() {
                // Auto-adjust questionCount if it exceeds maxQuestions
                if (this.questionCount > this.maxQuestions) {
                    this.questionCount = this.maxQuestions;
                } else if (this.questionCount < 1) {
                    this.questionCount = 1;
                } else if (this.maxQuestions >= 10) {
                    this.questionCount = 10;
                } else if (this.maxQuestions >= 5) {
                    this.questionCount = 5;
                } else {
                    this.questionCount = this.maxQuestions;
                }
            },
            openModal(subjectId, availableQuestions) {
                this.selectedSubject = subjectId;
                this.maxQuestions = availableQuestions;
                this.setQuestionCount();
                this.showModal = true;
            }
        }" 
        x-init="$watch('maxQuestions', value => setQuestionCount())">
        <!-- Header -->
        <div class="bg-white shadow-sm sticky top-0 z-10">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
                <div class="flex justify-between items-center">
                    <div>
                        <h1 class="text-2xl font-bold text-gray-900">Quiz App</h1>
                        <p class="text-sm text-gray-600">Welcome, {{ auth()->user()->name }}!</p>
                    </div>
                    <a href="{{ route('profile.dashboard') }}"
                        class="bg-emerald-600 text-white px-4 py-2 rounded-lg hover:bg-emerald-700 transition">
                        My Stats
                    </a>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
            @if(session('success'))
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg mb-6">
                    {{ session('success') }}
                </div>
            @endif

            @if(session('error'))
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mb-6">
                    {{ session('error') }}
                </div>
            @endif

            <h2 class="text-3xl font-bold text-gray-900 mb-6">Choose a Subject</h2>

            <!-- Subject Cards Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                @forelse($subjects as $subject)
                    <div
                        class="bg-white rounded-xl shadow-lg overflow-hidden hover:shadow-xl transition-shadow duration-300">
                        <div class="bg-gradient-to-r from-emerald-500 to-green-600 p-6">
                            <h3 class="text-xl font-bold text-white">{{ $subject->name }}</h3>
                        </div>
                        <div class="p-6">
                            <p class="text-gray-600 mb-4">{{ $subject->description }}</p>

                            <div class="grid grid-cols-2 text-sm text-gray-600 gap-2 mb-4">
                                <span class="flex items-center">
                                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                    </svg>
                                    {{ $subject->questions_count }} Questions
                                </span>

                                @if(isset($userScores[$subject->id]))
                                    <span class="text-emerald-600 font-semibold">
                                        Best:
                                        {{ round(($userScores[$subject->id]->correct / $userScores[$subject->id]->total) * 100) }}%
                                    </span>
                                @endif
                            </div>

                            @if($subject->questions_count > 0)
                                <button
                                    @click="openModal({{ $subject->id }}, {{ $subject->questions_count }})"
                                    class="block w-full bg-emerald-600 text-white text-center px-4 py-3 rounded-lg hover:bg-emerald-700 transition font-semibold">
                                    Start Quiz
                                </button>
                            @else
                                <button disabled
                                    class="block w-full bg-gray-300 text-gray-500 text-center px-4 py-3 rounded-lg cursor-not-allowed">
                                    No Questions Yet
                                </button>
                            @endif
                        </div>
                    </div>
                @empty
                    <div class="col-span-full text-center py-12">
                        <p class="text-gray-500 text-lg">No subjects available yet.</p>
                    </div>
                @endforelse
            </div>

            <!-- Quiz Request Button -->
            <div class="bg-white rounded-xl shadow-lg p-6 text-center">
                <h3 class="text-xl font-bold text-gray-900 mb-2">Want to Contribute?</h3>
                <p class="text-gray-600 mb-4">Submit your own quiz questions for review by our team</p>
                <a href="{{ route('quiz-requests.create') }}"
                    class="inline-block bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition font-semibold">
                    Request New Quiz
                </a>
                <a href="{{ route('quiz-requests.index') }}"
                    class="inline-block bg-gray-600 text-white px-6 py-3 rounded-lg hover:bg-gray-700 transition font-semibold ml-3">
                    My Requests
                </a>
            </div>
        </div>

        <!-- Bottom Navigation (Mobile) -->
        <div class="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 md:hidden">
            <div class="flex justify-around py-3">
                <a href="{{ route('dashboard') }}" class="flex flex-col items-center text-emerald-600">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                        <path
                            d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                    </svg>
                    <span class="text-xs mt-1">Home</span>
                </a>
                <a href="{{ route('profile.dashboard') }}" class="flex flex-col items-center text-gray-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                    </svg>
                    <span class="text-xs mt-1">Stats</span>
                </a>
                <a href="{{ route('quiz-requests.create') }}" class="flex flex-col items-center text-gray-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                    </svg>
                    <span class="text-xs mt-1">Request</span>
                </a>
            </div>
        </div>

        <!-- Question Count  Modal -->
        <div x-show="showModal" x-cloak class="fixed inset-0 z-50 overflow-y-auto"
            @keydown.escape.window="showModal = false">
            <!-- Backdrop -->
            <div class="fixed inset-0 bg-black bg-opacity-50 transition-opacity" @click="showModal = false"></div>

            <!-- Modal Content -->
            <div class="flex min-h-screen items-center justify-center p-4">
                <div class="relative bg-white rounded-2xl shadow-2xl max-w-md w-full p-8 transform transition-all"
                    @click.away="showModal = false">
                    <!-- Close Button -->
                    <button @click="showModal = false" class="absolute top-4 right-4 text-gray-400 hover:text-gray-600">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>

                    <!-- Modal Header -->
                    <div class="text-center mb-6">
                        <div
                            class="w-16 h-16 bg-gradient-to-br from-emerald-500 to-green-600 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                            </svg>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-900">How Many Questions?</h3>
                        <p class="text-gray-600 mt-2">Select the number of questions for your quiz</p>
                    </div>

                    <!-- Question Count Options -->
                    <div class="grid grid-cols-2 gap-3 mb-4">
                        <template x-for="count in [5, 10, 15, 20].filter(c => c <= maxQuestions)" :key="count">
                            <button @click="questionCount = count"
                                :class="questionCount === count ? 'bg-emerald-600 text-white' : 'bg-gray-100 text-gray-700 hover:bg-gray-200'"
                                class="px-4 py-3 rounded-lg font-semibold transition" x-text="`${count} Questions`">
                            </button>
                        </template>

                        <!-- Custom option for maxQuestions if it doesn't match presets -->
                        <template x-if="![5, 10, 15, 20].includes(maxQuestions) && maxQuestions > 0 && maxQuestions < 5">
                            <button @click="questionCount = maxQuestions"
                                :class="questionCount === maxQuestions ? 'bg-emerald-600 text-white' : 'bg-gray-100 text-gray-700 hover:bg-gray-200'"
                                class="px-4 py-3 rounded-lg font-semibold transition col-span-2" x-text="`All ${maxQuestions} Questions`">
                            </button>
                        </template>
                        
                        <!-- Show "All" option if maxQuestions is between standard options -->
                        <template x-if="maxQuestions > 5 && maxQuestions <= 20 && ![5, 10, 15, 20].includes(maxQuestions)">
                            <button @click="questionCount = maxQuestions"
                                :class="questionCount === maxQuestions ? 'bg-emerald-600 text-white' : 'bg-gray-100 text-gray-700 hover:bg-gray-200'"
                                class="px-4 py-3 rounded-lg font-semibold transition" x-text="`All ${maxQuestions}`">
                            </button>
                        </template>
                    </div>

                    <!-- Custom Question Count Input -->
                    <div class="mb-4">
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Or choose custom amount:</label>
                        <div class="flex items-center gap-3">
                            <input type="number" 
                                x-model.number="questionCount" 
                                :min="1" 
                                :max="maxQuestions"
                                @input="if(questionCount > maxQuestions) questionCount = maxQuestions; if(questionCount < 1) questionCount = 1;"
                                class="flex-1 px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-emerald-500 focus:ring-2 focus:ring-emerald-200 outline-none transition"
                                placeholder="Enter number">
                            <span class="text-gray-600 font-medium" x-text="`/ ${maxQuestions}`"></span>
                        </div>
                        <p class="text-xs text-gray-500 mt-1">Enter any number between 1 and <span x-text="maxQuestions"></span></p>
                    </div>

                    <!-- Info message -->
                    <div class="bg-emerald-50 border border-emerald-200 rounded-lg p-3 mb-4">
                        <p class="text-sm text-emerald-800 text-center">
                            <svg class="w-4 h-4 inline mr-1" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
                            </svg>
                            <span x-text="`${maxQuestions} question${maxQuestions === 1 ? '' : 's'} available for this subject`"></span>
                        </p>
                    </div>

                    <!-- Start Button -->
                    <a :href="`/quiz/${selectedSubject}?count=${questionCount}`"
                        class="block w-full bg-gradient-to-r from-emerald-600 to-green-600 text-white text-center px-6 py-4 rounded-lg hover:from-emerald-700 hover:to-green-700 transition font-bold text-lg shadow-lg">
                        Start Quiz →
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>