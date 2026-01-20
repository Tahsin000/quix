<x-app-layout>
    <div class="min-h-screen bg-gradient-to-br from-emerald-50 to-green-50 py-8 px-4">
        <div class="max-w-4xl mx-auto">
            <!-- Header -->
            <div class="mb-8">
                <a href="{{ route('dashboard') }}" class="text-emerald-600 hover:text-emerald-800 flex items-center mb-4">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    Back to Dashboard
                </a>
                <h1 class="text-3xl font-bold text-gray-900">My Quiz Requests</h1>
                <p class="text-gray-600 mt-2">Track the status of your submitted questions</p>
            </div>

            @if(session('success'))
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg mb-6">
                    {{ session('success') }}
                </div>
            @endif

            <!-- Requests List -->
            <div class="space-y-4">
                @forelse($requests as $request)
                    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                        <div class="p-6">
                            <div class="flex justify-between items-start mb-4">
                                <div class="flex-1">
                                    <h3 class="text-lg font-bold text-gray-900 mb-2">{{ $request->question_text }}</h3>
                                    <p class="text-sm text-gray-600">Subject: <span
                                            class="font-semibold">{{ $request->subject->name }}</span></p>
                                    <p class="text-sm text-gray-500 mt-1">Submitted:
                                        {{ $request->created_at->format('M d, Y') }}</p>
                                </div>
                                <div>
                                    @if($request->status === 'pending')
                                        <span
                                            class="inline-block px-3 py-1 bg-yellow-100 text-yellow-800 rounded-full text-sm font-semibold">
                                            Pending
                                        </span>
                                    @elseif($request->status === 'approved')
                                        <span
                                            class="inline-block px-3 py-1 bg-green-100 text-green-800 rounded-full text-sm font-semibold">
                                            ✓ Approved
                                        </span>
                                    @else
                                        <span
                                            class="inline-block px-3 py-1 bg-red-100 text-red-800 rounded-full text-sm font-semibold">
                                            ✗ Rejected
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <!-- Options Preview -->
                            <div class="grid grid-cols-2 gap-2 mb-4">
                                @foreach(['a', 'b', 'c', 'd'] as $option)
                                    <div
                                        class="text-sm p-2 bg-gray-50 rounded {{ $request->correct_answer === $option ? 'border-2 border-green-500' : '' }}">
                                        <span class="font-semibold">{{ strtoupper($option) }}:</span>
                                        {{ $request->{'option_' . $option} }}
                                    </div>
                                @endforeach
                            </div>

                            <!-- Admin Notes (if rejected) -->
                            @if($request->status === 'rejected' && $request->admin_notes)
                                <div class="mt-4 p-4 bg-red-50 border border-red-200 rounded-lg">
                                    <p class="text-sm font-semibold text-red-800 mb-1">Admin Feedback:</p>
                                    <p class="text-sm text-red-700">{{ $request->admin_notes }}</p>
                                </div>
                            @endif

                            <!-- Approval Info (if approved) -->
                            @if($request->status === 'approved')
                                <div class="mt-4 p-4 bg-green-50 border border-green-200 rounded-lg">
                                    <p class="text-sm text-green-800">
                                        <svg class="w-5 h-5 inline mr-1" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd"
                                                d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                clip-rule="evenodd" />
                                        </svg>
                                        Your question has been added to the quiz pool! Thank you for contributing!
                                    </p>
                                </div>
                            @endif
                        </div>
                    </div>
                @empty
                    <div class="bg-white rounded-xl shadow-lg p-12 text-center">
                        <div class="text-6xl mb-4">📝</div>
                        <h3 class="text-xl font-bold text-gray-900 mb-2">No Requests Yet</h3>
                        <p class="text-gray-600 mb-6">You haven't submitted any quiz requests yet.</p>
                        <a href="{{ route('quiz-requests.create') }}"
                            class="inline-block bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition font-semibold">
                            Submit Your First Quiz
                        </a>
                    </div>
                @endforelse
            </div>

            <!-- New Request Button -->
            @if($requests->isNotEmpty())
                <div class="mt-6 text-center">
                    <a href="{{ route('quiz-requests.create') }}"
                        class="inline-block bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition font-semibold">
                        Submit Another Quiz
                    </a>
                </div>
            @endif
        </div>
    </div>
</x-app-layout>
