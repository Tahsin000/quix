<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Quiz Platform') }} - Login & Start Learning</title>

    <!-- SEO Meta Tags -->
    <x-seo-meta />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans text-gray-900 antialiased">
    <div class="min-h-screen flex flex-col justify-between bg-gradient-to-br from-emerald-50 to-green-100">
        <!-- Main Content Area -->
        <div class="flex-1 flex flex-col justify-center items-center py-12 px-4">
            <div class="mb-6">
                <a href="/">
                    <!-- Modern Quiz Logo -->
                    <div
                        class="w-20 h-20 bg-gradient-to-br from-emerald-500 to-green-600 rounded-2xl flex items-center justify-center shadow-lg hover:shadow-xl transition-shadow">
                        <svg class="w-12 h-12 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                        </svg>
                    </div>
                </a>
            </div>

            <div
                class="w-full sm:max-w-md px-8 py-8 bg-white/90 backdrop-blur-sm shadow-2xl overflow-hidden sm:rounded-2xl border border-emerald-100">
                {{ $slot }}
            </div>
        </div>

        <!-- Footer - Always at bottom -->
        <x-footer />
    </div>
</body>

</html>
