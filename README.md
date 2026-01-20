# Laravel Quiz Application

A comprehensive quiz management system built with Laravel and Filament, featuring user authentication, subject-based MCQ quizzes, instant feedback, and an admin approval workflow for user-submitted questions.

## Features

### For Users

- ✅ Register and login with email
- ✅ Browse active quiz subjects
- ✅ Take randomized MCQ quizzes
- ✅ Get instant feedback on answers
- ✅ View correct answers immediately
- ✅ Track quiz scores
- ✅ Submit new quiz questions for review
- ✅ Monitor request approval status

### For Admins

- ✅ Modern Filament admin panel
- ✅ Manage subjects (create, edit, activate/deactivate)
- ✅ Create and edit quiz questions
- ✅ Approve or reject user-submitted questions
- ✅ Add admin notes to rejected submissions
- ✅ Auto-convert approved requests to active questions

## Quick Start

### Prerequisites

- PHP 8.2+
- Composer
- Node.js & NPM

### Installation

```bash
# Navigate to project directory
cd quiz-app

# Install dependencies (if not already done)
composer install
npm install && npm run build

# Configure environment
cp .env.example .env
php artisan key:generate

# Run migrations and seed data
php artisan migrate:fresh --seed

# Create admin user
php artisan make:filament-user

# Start development server
php artisan serve
```

### Access Application

- **User Interface**: http://localhost:8000
- **Admin Panel**: http://localhost:8000/admin

### Login Credentials

**Test Users** (created by seeder):

- Email: `user@example.com` | Password: `password`
- Email: `admin@example.com` | Password: `password`

**Admin User** (created by make:filament-user command):

- Use credentials you entered during setup

## Database Schema

### Subjects

- Name, description, active status
- Relationship with questions and quiz requests

### Questions

- Subject association
- Question text with 4 multiple choice options
- Correct answer indicator (a/b/c/d)
- Active status and creator tracking

### Quiz Attempts

- Tracks user answers
- Records correctness for scoring
- Linked to user, subject, and question

### Quiz Requests

- User-submitted questions
- Status: pending/approved/rejected
- Admin review workflow with notes

## Project Structure

```
quiz-app/
├── app/
│   ├── Filament/Resources/     # Admin panel resources
│   ├── Http/Controllers/       # Frontend controllers
│   └── Models/                 # Eloquent models
├── database/
│   ├── migrations/             # Database schema
│   └── seeders/                # Sample data
├── routes/
│   └── web.php                 # Application routes
└── resources/views/            # Blade templates (to be created)
```

## Pending Work

The backend is fully implemented. To complete the project, create these Blade views:

1. `resources/views/subjects/index.blade.php` - Subject selection page
2. `resources/views/quiz/show.blade.php` - Quiz taking interface
3. `resources/views/quiz-requests/create.blade.php` - New quiz request form
4. `resources/views/quiz-requests/index.blade.php` - Request status list

All routes, controllers, and business logic are ready to use.

## Tech Stack

- **Laravel 11.x** - PHP framework
- **Filament 3.x** - Admin panel
- **Laravel Breeze** - Authentication scaffolding
- **SQLite** - Database (easy setup, file-based)
- **Tailwind CSS** - Styling (via Breeze)

## License

Open-source project for educational purposes.
