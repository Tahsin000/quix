@props([
    'title' => config('app.name', 'Quiz Platform'),
    'description' =>
        'A comprehensive quiz platform to test your knowledge, track your progress, and excel in various subjects. Interactive learning made easy.',
    'keywords' =>
        'quiz, online quiz, test, exam, learning platform, education, knowledge test, practice quiz, study tool',
    'image' => asset('social-preview.svg'),
    'url' => url()->current(),
])

<!-- Primary Meta Tags -->
<meta name="title" content="{{ $title }}">
<meta name="description" content="{{ $description }}">
<meta name="keywords" content="{{ $keywords }}">
<meta name="author" content="Tahsin Abrar">
<meta name="robots" content="index, follow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="language" content="English">
<meta name="revisit-after" content="7 days">

<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="{{ $url }}">
<meta property="og:title" content="{{ $title }}">
<meta property="og:description" content="{{ $description }}">
<meta property="og:image" content="{{ $image }}">
<meta property="og:site_name" content="{{ config('app.name', 'Quiz Platform') }}">
<meta property="og:locale" content="en_US">

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="{{ $url }}">
<meta property="twitter:title" content="{{ $title }}">
<meta property="twitter:description" content="{{ $description }}">
<meta property="twitter:image" content="{{ $image }}">
<meta name="twitter:creator" content="@tahsinabrar">

<!-- LinkedIn -->
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">

<!-- Additional SEO -->
<meta name="theme-color" content="#10b981">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="{{ config('app.name', 'Quiz Platform') }}">

<!-- Canonical URL -->
<link rel="canonical" href="{{ $url }}">

<!-- Favicon -->
<link rel="icon" type="image/svg+xml" href="{{ asset('favicon.svg') }}">
<link rel="alternate icon" href="{{ asset('favicon.ico') }}">
<link rel="apple-touch-icon" href="{{ asset('apple-touch-icon.png') }}">

<!-- JSON-LD Structured Data -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebApplication",
  "name": "{{ config('app.name', 'Quiz Platform') }}",
  "description": "{{ $description }}",
  "url": "{{ config('app.url') }}",
  "applicationCategory": "EducationalApplication",
  "author": {
    "@type": "Person",
    "name": "Tahsin Abrar",
    "url": "https://github.com/Tahsin000",
    "sameAs": [
      "https://github.com/Tahsin000",
      "https://www.linkedin.com/in/tahsin-abrar/"
    ]
  },
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "ratingCount": "100"
  }
}
</script>
