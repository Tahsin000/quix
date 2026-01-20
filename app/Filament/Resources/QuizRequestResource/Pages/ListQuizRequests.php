<?php

namespace App\Filament\Resources\QuizRequestResource\Pages;

use App\Filament\Resources\QuizRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListQuizRequests extends ListRecords
{
    protected static string $resource = QuizRequestResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
