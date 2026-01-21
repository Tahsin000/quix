<div class="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 md:hidden z-50">
    <div class="flex justify-around py-3">
        <a href="{{ route('dashboard') }}"
            class="flex flex-col items-center {{ request()->routeIs('dashboard') ? 'text-emerald-600' : 'text-gray-600' }}">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                <path
                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
            </svg>
            <span class="text-xs mt-1">Home</span>
        </a>
        <a href="{{ route('profile.dashboard') }}"
            class="flex flex-col items-center {{ request()->routeIs('profile.dashboard') ? 'text-emerald-600' : 'text-gray-600' }}">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
            </svg>
            <span class="text-xs mt-1">Stats</span>
        </a>
        <a href="{{ route('quiz-requests.create') }}"
            class="flex flex-col items-center {{ request()->routeIs('quiz-requests.create') ? 'text-emerald-600' : 'text-gray-600' }}">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
            </svg>
            <span class="text-xs mt-1">Request</span>
        </a>
    </div>
</div>