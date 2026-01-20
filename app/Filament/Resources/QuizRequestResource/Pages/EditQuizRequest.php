<?php

namespace App\Filament\Resources\QuizRequestResource\Pages;

use App\Filament\Resources\QuizRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditQuizRequest extends EditRecord
{
    protected static string $resource = QuizRequestResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
