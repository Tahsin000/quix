<x-app-layout>
    <div class="min-h-screen bg-gradient-to-br from-emerald-50 to-green-100">
        <!-- Quiz Header -->
        <div class="bg-white shadow-md sticky top-0 z-10">
            <div class="max-w-4xl mx-auto px-4 py-4">
                <div class="flex justify-between items-center">
                    <div class="flex-1">
                        <h2 class="text-lg font-bold text-gray-900">{{ $subject->name }}</h2>
                        <div class="flex items-center gap-4 text-sm">
                            <p class="text-gray-600">Score: <span id="score"
                                    class="font-semibold text-emerald-600">{{ $answeredCount }}</span></p>
                            <p class="text-gray-600">
                                <svg class="w-4 h-4 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                                <span id="timer" class="font-semibold text-blue-600">0:00</span>
                            </p>
                        </div>
                    </div>
                    <a href="{{ route('dashboard') }}" class="text-gray-600 hover:text-gray-900">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </a>
                </div>
            </div>
        </div>

        <!-- Quiz Content -->
        <div class="max-w-4xl mx-auto px-4 py-8">
            @if(session('info'))
                <div class="bg-blue-100 border border-blue-400 text-blue-700 px-4 py-3 rounded-lg mb-6">
                    {{ session('info') }}
                </div>
            @endif

            @if(session('error'))
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mb-6">
                    {{ session('error') }}
                </div>
            @endif

            <div class="bg-white rounded-2xl shadow-xl overflow-hidden">
                <!-- Question Container -->
                <div class="p-6 md:p-8">
                    <div class="mb-6">
                        <span
                            class="inline-block bg-emerald-100 text-emerald-800 px-3 py-1 rounded-full text-sm font-semibold mb-4">
                            Question #<span id="question-number">1</span>
                        </span>
                        <h3 id="question-text" class="text-2xl md:text-3xl font-bold text-gray-900 leading-relaxed">
                            {{ $question->question_text }}
                        </h3>
                    </div>

                    <!-- Options -->
                    <div id="options-container" class="space-y-3">
                        @foreach(['a', 'b', 'c', 'd'] as $option)
                            <button onclick="selectAnswer('{{ $option }}')" id="option-{{ $option }}"
                                class="option-btn w-full text-left p-5 border-2 border-gray-300 rounded-xl hover:border-emerald-500 hover:bg-emerald-50 transition duration-200 focus:outline-none focus:ring-2 focus:ring-emerald-500">
                                <span class="flex items-center">
                                    <span
                                        class="flex items-center justify-center w-10 h-10 rounded-full bg-gray-200 text-gray-700 font-bold mr-4">
                                        {{ strtoupper($option) }}
                                    </span>
                                    <span class="text-lg text-gray-800">{{ $question->{'option_' . $option} }}</span>
                                </span>
                            </button>
                        @endforeach
                    </div>

                    <!-- Feedback Area -->
                    <div id="feedback" class="mt-6 hidden">
                        <div id="feedback-content" class="p-4 rounded-lg"></div>
                        <button id="next-btn" onclick="nextQuestion()"
                            class="w-full mt-4 bg-emerald-600 text-white px-6 py-4 rounded-xl hover:bg-emerald-700 transition font-bold text-lg">
                            Next Question →
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let currentQuestionId = {{ $question->id }};
        let selectedOption = null;
        let score = {{ $answeredCount }};
        let questionStartTime = Date.now(); // Track when question started
        let timerInterval;

        // Start timer
        function startTimer() {
            timerInterval = setInterval(function () {
                let elapsed = Math.floor((Date.now() - questionStartTime) / 1000);
                let minutes = Math.floor(elapsed / 60);
                let seconds = elapsed % 60;
                document.getElementById('timer').textContent =
                    minutes + ':' + (seconds < 10 ? '0' + seconds : seconds);
            }, 1000);
        }

        // Stop timer
        function stopTimer() {
            if (timerInterval) {
                clearInterval(timerInterval);
            }
        }

        // Start timer on page load
        startTimer();

        function selectAnswer(option) {
            if (selectedOption) return; // Prevent multiple selections

            selectedOption = option;

            // Disable all buttons
            document.querySelectorAll('.option-btn').forEach(btn => {
                btn.disabled = true;
                btn.classList.add('opacity-50', 'cursor-not-allowed');
            });

            // Calculate time taken
            let timeTaken = (Date.now() - questionStartTime) / 1000; // in seconds
            stopTimer();

            // Submit answer
            fetch('{{ route('quiz.answer') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    question_id: currentQuestionId,
                    selected_answer: option,
                    time_taken: timeTaken.toFixed(2),
                    started_at: questionStartTime
                })
            })
                .then(response => response.json())
                .then(data => {
                    showFeedback(data);
                });
        }

        function showFeedback(data) {
            const feedbackDiv = document.getElementById('feedback');
            const feedbackContent = document.getElementById('feedback-content');
            const selectedBtn = document.getElementById('option-' + selectedOption);
            const correctBtn = document.getElementById('option-' + data.correct_answer);

            // Highlight selected answer
            if (data.is_correct) {
                selectedBtn.classList.remove('border-gray-300');
                selectedBtn.classList.add('border-green-500', 'bg-green-100');
                feedbackContent.className = 'p-4 rounded-lg bg-green-100 border-2 border-green-500';
                feedbackContent.innerHTML = `
                    <div class="flex items-center">
                        <svg class="w-6 h-6 text-green-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                        </svg>
                        <span class="text-green-800 font-semibold text-lg">Correct! Well done! 🎉</span>
                    </div>
                `;
                score++;
                document.getElementById('score').textContent = score;
            } else {
                selectedBtn.classList.remove('border-gray-300');
                selectedBtn.classList.add('border-red-500', 'bg-red-100');
                correctBtn.classList.remove('border-gray-300');
                correctBtn.classList.add('border-green-500', 'bg-green-100');
                feedbackContent.className = 'p-4 rounded-lg bg-red-100 border-2 border-red-500';
                feedbackContent.innerHTML = `
                    <div class="flex items-center mb-2">
                        <svg class="w-6 h-6 text-red-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                        </svg>
                        <span class="text-red-800 font-semibold text-lg">Incorrect</span>
                    </div>
                    <p class="text-gray-700">The correct answer is: <strong>${data.correct_answer_text}</strong></p>
                `;
            }

            feedbackDiv.classList.remove('hidden');

            // Update next button
            const nextBtn = document.getElementById('next-btn');
            if (!data.has_next) {
                nextBtn.textContent = 'See Results →';
                nextBtn.onclick = function () {
                    window.location.href = '{{ route('quiz.results', $subject->id) }}';
                };
            }
        }

        function nextQuestion() {
            window.location.href = '{{ route('quiz.next', $subject->id) }}';
        }
    </script>
</x-app-layout>