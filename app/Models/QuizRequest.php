<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuizRequest extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'subject_id',
        'question_text',
        'option_a',
        'option_b',
        'option_c',
        'option_d',
        'correct_answer',
        'status',
        'admin_notes',
        'reviewed_by',
        'reviewed_at',
    ];

    protected $casts = [
        'reviewed_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function subject()
    {
        return $this->belongsTo(Subject::class);
    }

    public function reviewer()
    {
        return $this->belongsTo(User::class, 'reviewed_by');
    }

    public function scopePending($query)
    {
        return $query->where('status', 'pending');
    }

    public function scopeApproved($query)
    {
        return $query->where('status', 'approved');
    }

    public function scopeRejected($query)
    {
        return $query->where('status', 'rejected');
    }

    public function approve($adminId)
    {
        $this->update([
            'status' => 'approved',
            'reviewed_by' => $adminId,
            'reviewed_at' => now(),
        ]);

        // Create the question from this request
        Question::create([
            'subject_id' => $this->subject_id,
            'question_text' => $this->question_text,
            'option_a' => $this->option_a,
            'option_b' => $this->option_b,
            'option_c' => $this->option_c,
            'option_d' => $this->option_d,
            'correct_answer' => $this->correct_answer,
            'created_by' => $this->user_id,
            'is_active' => true,
        ]);
    }

    public function reject($adminId, $notes = null)
    {
        $this->update([
            'status' => 'rejected',
            'reviewed_by' => $adminId,
            'reviewed_at' => now(),
            'admin_notes' => $notes,
        ]);
    }
}
