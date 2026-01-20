<?php

namespace Database\Seeders;

use App\Models\Subject;
use App\Models\Question;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Create test user
        User::create([
            'name' => 'Test User',
            'email' => 'user@example.com',
            'password' => Hash::make('password'),
        ]);

        // Create admin user
        User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
        ]);

        // Create subjects
        $mathSubject = Subject::create([
            'name' => 'Mathematics',
            'description' => 'Test your mathematical knowledge',
            'is_active' => true,
        ]);

        $scienceSubject = Subject::create([
            'name' => 'Science',
            'description' => 'Explore scientific concepts',
            'is_active' => true,
        ]);

        $historySubject = Subject::create([
            'name' => 'History',
            'description' => 'Learn about historical events',
            'is_active' => true,
        ]);

        // Create Math questions
        Question::create([
            'subject_id' => $mathSubject->id,
            'question_text' => 'What is 2 + 2?',
            'option_a' => '3',
            'option_b' => '4',
            'option_c' => '5',
            'option_d' => '6',
            'correct_answer' => 'b',
            'is_active' => true,
        ]);

        Question::create([
            'subject_id' => $mathSubject->id,
            'question_text' => 'What is 10 × 5?',
            'option_a' => '50',
            'option_b' => '40',
            'option_c' => '60',
            'option_d' => '45',
            'correct_answer' => 'a',
            'is_active' => true,
        ]);

        Question::create([
            'subject_id' => $mathSubject->id,
            'question_text' => 'What is the square root of 16?',
            'option_a' => '2',
            'option_b' => '3',
            'option_c' => '4',
            'option_d' => '5',
            'correct_answer' => 'c',
            'is_active' => true,
        ]);

        // Create Science questions
        Question::create([
            'subject_id' => $scienceSubject->id,
            'question_text' => 'What is the chemical symbol for water?',
            'option_a' => 'O2',
            'option_b' => 'H2O',
            'option_c' => 'CO2',
            'option_d' => 'HO',
            'correct_answer' => 'b',
            'is_active' => true,
        ]);

        Question::create([
            'subject_id' => $scienceSubject->id,
            'question_text' => 'How many planets are in our solar system?',
            'option_a' => '7',
            'option_b' => '8',
            'option_c' => '9',
            'option_d' => '10',
            'correct_answer' => 'b',
            'is_active' => true,
        ]);

        // Create History questions
        Question::create([
            'subject_id' => $historySubject->id,
            'question_text' => 'In which year did World War II end?',
            'option_a' => '1943',
            'option_b' => '1944',
            'option_c' => '1945',
            'option_d' => '1946',
            'correct_answer' => 'c',
            'is_active' => true,
        ]);

        Question::create([
            'subject_id' => $historySubject->id,
            'question_text' => 'Who was the first President of the United States?',
            'option_a' => 'Thomas Jefferson',
            'option_b' => 'George Washington',
            'option_c' => 'John Adams',
            'option_d' => 'Benjamin Franklin',
            'correct_answer' => 'b',
            'is_active' => true,
        ]);
    }
}
