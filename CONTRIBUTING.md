# Contributing to Quiz Application

First off, thank you for considering contributing to Quiz Application! It's people like you that make this project such a great tool.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)

---

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all. Please be respectful and constructive in your interactions.

### Our Standards

**Positive behaviors include:**

- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community

**Unacceptable behaviors include:**

- Trolling, insulting/derogatory comments
- Public or private harassment
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

---

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**When reporting bugs, include:**

- Clear, descriptive title
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Environment details (OS, PHP version, browser, etc.)

**Bug Report Template:**

```markdown
**Description:**
A clear description of what the bug is.

**Steps to Reproduce:**

1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

**Expected Behavior:**
What you expected to happen.

**Actual Behavior:**
What actually happened.

**Screenshots:**
If applicable, add screenshots.

**Environment:**

- OS: [e.g., Windows 11, macOS 13]
- PHP Version: [e.g., 8.2.1]
- Browser: [e.g., Chrome 120]
- Database: [e.g., MySQL 8.0]
```

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues.

**When suggesting enhancements, include:**

- Clear, descriptive title
- Detailed description of the proposed feature
- Why this enhancement would be useful
- Possible implementation approach (if you have ideas)

### Pull Requests

We actively welcome your pull requests!

**Areas we'd love help with:**

- 📱 Mobile responsiveness improvements
- ♿ Accessibility enhancements
- 🌍 Internationalization (i18n)
- 🎨 UI/UX improvements
- 🧪 Test coverage
- 📝 Documentation
- 🐛 Bug fixes
- ✨ New features

---

## Development Setup

### Prerequisites

- PHP 8.2+
- Composer
- Node.js 18+
- MySQL/SQLite
- Git

### Fork and Clone

```bash
# Fork the repository on GitHub, then:

# Clone your fork
git clone https://github.com/YOUR_USERNAME/quiz-application.git
cd quiz-application

# Add upstream remote
git remote add upstream https://github.com/ORIGINAL_OWNER/quiz-application.git
```

### Install Dependencies

```bash
# PHP dependencies
composer install

# JavaScript dependencies
npm install

# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate

# Create database (SQLite for development)
touch database/database.sqlite

# Run migrations with seed data
php artisan migrate:fresh --seed

# Build assets
npm run dev
```

### Create Admin User

```bash
php artisan make:filament-user
```

### Start Development Server

```bash
# Terminal 1: Laravel
php artisan serve

# Terminal 2: Vite (hot reload)
npm run dev
```

---

## Coding Standards

### PHP

We follow [PSR-12](https://www.php-fig.org/psr/psr-12/) coding standards.

**Key points:**

- Use 4 spaces for indentation (no tabs)
- Opening braces for classes and methods go on the next line
- Use type hints where possible
- Write descriptive variable and method names

**Example:**

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class QuizController extends Controller
{
    public function show(Request $request, int $subjectId): View
    {
        $subject = Subject::findOrFail($subjectId);

        return view('quiz.show', compact('subject'));
    }
}
```

**Formatting:**

```bash
# Format code using Laravel Pint
./vendor/bin/pint

# Check code style
./vendor/bin/pint --test
```

### JavaScript

We use ES6+ syntax with consistent formatting.

**Key points:**

- Use 2 spaces for indentation
- Use `const` and `let`, avoid `var`
- Use template literals for string interpolation
- Use arrow functions where appropriate

**Example:**

```javascript
// Good
const startTimer = () => {
    const elapsed = Math.floor((Date.now() - questionStartTime) / 1000);
    timer.textContent = `${elapsed}s`;
};

// Avoid
var startTimer = function () {
    var elapsed = Math.floor((Date.now() - questionStartTime) / 1000);
    timer.textContent = elapsed + "s";
};
```

### Blade Templates

**Key points:**

- Use 4 spaces for indentation
- Use Blade directives over raw PHP where possible
- Keep logic minimal in views
- Extract reusable components

**Example:**

```blade
<x-app-layout>
    <div class="container mx-auto px-4">
        @if($subjects->isNotEmpty())
            <div class="grid grid-cols-3 gap-4">
                @foreach($subjects as $subject)
                    <x-subject-card :subject="$subject" />
                @endforeach
            </div>
        @else
            <p>No subjects available.</p>
        @endif
    </div>
</x-app-layout>
```

### CSS/Tailwind

**Key points:**

- Use Tailwind utility classes
- Create custom components for repeated patterns
- Use responsive modifiers (`sm:`, `md:`, `lg:`)
- Maintain consistent spacing scale

---

## Commit Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/).

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Examples

```bash
# Feature
git commit -m "feat(quiz): add timer functionality to track question duration"

# Bug fix
git commit -m "fix(auth): resolve login redirect loop issue"

# Documentation
git commit -m "docs(readme): add deployment instructions for VPS"

# Multiple paragraphs
git commit -m "feat(mobile): implement bottom navigation

- Added fixed bottom navigation component
- Applied to all main pages
- Includes Home, Stats, and Request links

Closes #123"
```

---

## Pull Request Process

### Before Submitting

1. **Create a feature branch**

    ```bash
    git checkout -b feature/amazing-feature
    ```

2. **Make your changes**
    - Write clean, readable code
    - Follow coding standards
    - Add tests if applicable

3. **Test your changes**

    ```bash
    # Run PHP tests
    php artisan test

    # Check code style
    ./vendor/bin/pint --test

    # Build assets
    npm run build
    ```

4. **Commit your changes**

    ```bash
    git add .
    git commit -m "feat: add amazing feature"
    ```

5. **Update from upstream**

    ```bash
    git fetch upstream
    git rebase upstream/main
    ```

6. **Push to your fork**
    ```bash
    git push origin feature/amazing-feature
    ```

### Creating the Pull Request

1. Go to the original repository on GitHub
2. Click "New Pull Request"
3. Select your fork and branch
4. Fill in the PR template:

```markdown
## Description

Brief description of what this PR does.

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Related Issues

Closes #123

## Screenshots (if applicable)

[Add screenshots here]

## Checklist

- [ ] My code follows the style guidelines
- [ ] I have performed a self-review
- [ ] I have commented my code where necessary
- [ ] I have updated the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix/feature works
- [ ] New and existing tests pass locally
```

### Review Process

1. **Automated Checks**: CI/CD will run tests automatically
2. **Code Review**: Maintainers will review your code
3. **Revisions**: Make requested changes if needed
4. **Approval**: Once approved, a maintainer will merge

### After Merge

1. **Delete your branch**

    ```bash
    git branch -d feature/amazing-feature
    git push origin --delete feature/amazing-feature
    ```

2. **Update your fork**
    ```bash
    git checkout main
    git pull upstream main
    git push origin main
    ```

---

## Testing

### Running Tests

```bash
# Run all tests
php artisan test

# Run specific test file
php artisan test tests/Feature/QuizControllerTest.php

# Run with coverage
php artisan test --coverage
```

### Writing Tests

**Example Feature Test:**

```php
<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\Subject;

class QuizTest extends TestCase
{
    public function test_user_can_start_quiz()
    {
        $user = User::factory()->create();
        $subject = Subject::factory()->create();

        $response = $this->actingAs($user)
            ->get("/quiz/{$subject->id}");

        $response->assertStatus(200);
        $response->assertSee($subject->name);
    }
}
```

---

## Documentation

### Updating Documentation

If your changes affect the user-facing features:

1. Update `README.md`
2. Update `API.md` if API changes
3. Add/update inline code comments
4. Update `DEPLOYMENT.md` if deployment changes

### Documentation Style

- Use clear, concise language
- Include code examples
- Add screenshots where helpful
- Keep structure organized

---

## Questions?

- 💬 **Discussions**: Use GitHub Discussions for questions
- 🐛 **Issues**: Report bugs in GitHub Issues

---

## Recognition

Contributors will be added to the README's Contributors section. Thank you for your contributions! 🙏

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
