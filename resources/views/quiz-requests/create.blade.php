<x-app-layout>
    <div class="min-h-screen bg-gradient-to-br from-emerald-50 to-green-50 py-8 px-4">
        <div class="max-w-4xl mx-auto">
            <!-- Header -->
            <div class="mb-8">
                <a href="{{ route('dashboard') }}"
                    class="text-emerald-600 hover:text-emerald-800 flex items-center mb-4">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    Back to Home
                </a>
                <h1 class="text-3xl font-bold text-gray-900">Request New Quiz Questions</h1>
                <p class="text-gray-600 mt-2">Submit questions individually or import multiple at once via JSON</p>
            </div>

            <!-- Tabs -->
            <div x-data="{ activeTab: 'single' }" class="bg-white rounded-2xl shadow-xl overflow-hidden">
                <!-- Tab Headers -->
                <div class="flex border-b border-gray-200">
                    <button @click="activeTab = 'single'"
                        :class="activeTab === 'single' ? 'border-b-2 border-emerald-600 text-emerald-600' : 'text-gray-500 hover:text-gray-700'"
                        class="flex-1 px-6 py-4 font-semibold transition-colors">
                        Single Question
                    </button>
                    <button @click="activeTab = 'bulk'"
                        :class="activeTab === 'bulk' ? 'border-b-2 border-emerald-600 text-emerald-600' : 'text-gray-500 hover:text-gray-700'"
                        class="flex-1 px-6 py-4 font-semibold transition-colors">
                        Bulk Import (JSON)
                    </button>
                </div>

                <!-- Single Question Tab -->
                <div x-show="activeTab === 'single'" class="p-6 md:p-8">
                    <form method="POST" action="{{ route('quiz-requests.store') }}" class="space-y-6">
                        @csrf

                        <!-- Subject Selection -->
                        <div>
                            <label for="subject_id" class="block text-sm font-semibold text-gray-700 mb-2">Select
                                Subject *</label>
                            <select name="subject_id" id="subject_id" required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">
                                <option value="">Choose a subject...</option>
                                @foreach($subjects as $subject)
                                    <option value="{{ $subject->id }}">{{ $subject->name }}</option>
                                @endforeach
                            </select>
                            @error('subject_id')
                                <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <!-- Question Text -->
                        <div>
                            <label for="question_text" class="block text-sm font-semibold text-gray-700 mb-2">Question
                                *</label>
                            <textarea name="question_text" id="question_text" rows="4" required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500"
                                placeholder="Enter your question here...">{{ old('question_text') }}</textarea>
                            @error('question_text')
                                <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <!-- Options -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            @foreach(['a' => 'A', 'b' => 'B', 'c' => 'C', 'd' => 'D'] as $key => $label)
                                <div>
                                    <label for="option_{{ $key }}"
                                        class="block text-sm font-semibold text-gray-700 mb-2">Option {{ $label }} *</label>
                                    <input type="text" name="option_{{ $key }}" id="option_{{ $key }}" required
                                        value="{{ old('option_' . $key) }}"
                                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500"
                                        placeholder="Enter option {{ $label  }}..." />
                                    @error('option_' . $key)
                                        <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            @endforeach
                        </div>

                        <!-- Correct Answer -->
                        <div>
                            <label for="correct_answer" class="block text-sm font-semibold text-gray-700 mb-2">Correct
                                Answer *</label>
                            <select name="correct_answer" id="correct_answer" required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">
                                <option value="">Select correct answer...</option>
                                <option value="a">Option A</option>
                                <option value="b">Option B</option>
                                <option value="c">Option C</option>
                                <option value="d">Option D</option>
                            </select>
                            @error('correct_answer')
                                <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <!-- Submit Button -->
                        <div class="flex justify-end">
                            <button type="submit"
                                class="px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white font-semibold rounded-lg transition-colors shadow-lg">
                                Submit Question
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Bulk Import Tab -->
                <div x-show="activeTab === 'bulk'" class="p-6 md:p-8">
                    <div class="mb-6 bg-emerald-50 border border-emerald-200 rounded-lg p-4">
                        <h3 class="font-semibold text-emerald-900 mb-2">JSON Format Example:</h3>
                        <pre class="bg-white p-4 rounded border border-emerald-200 text-xs overflow-x-auto"><code>[
  {
    "subject_id": 1,
    "question_text": "What is 2 + 2?",
    "option_a": "3",
    "option_b": "4",
    "option_c": "5",
    "option_d": "6",
    "correct_answer": "b"
  },
  {
    "subject_id": 2,
    "question_text": "What is the capital of France?",
    "option_a": "London",
    "option_b": "Berlin",
    "option_c": "Paris",
    "option_d": "Madrid",
    "correct_answer": "c"
  }
]</code></pre>
                        <p class="text-sm text-emerald-800 mt-2">
                            <strong>Note:</strong> subject_id must match existing subject IDs.
                            Correct answer must be one of: a, b, c, d
                        </p>
                    </div>

                    <form method="POST" action="{{ route('quiz-requests.store-bulk') }}" class="space-y-6">
                        @csrf

                        <!-- JSON Input -->
                        <div>
                            <label for="json_data" class="block text-sm font-semibold text-gray-700 mb-2">Paste JSON
                                Data *</label>
                            <textarea name="json_data" id="json_data" rows="12" required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 font-mono text-sm"
                                placeholder="Paste your JSON array here...">{{ old('json_data') }}</textarea>
                            @error('json_data')
                                <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <!-- Submit Button -->
                        <div class="flex justify-end">
                            <button type="submit"
                                class="px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white font-semibold rounded-lg transition-colors shadow-lg">
                                Import Questions
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>