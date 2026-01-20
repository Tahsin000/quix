<?php

namespace App\Filament\Resources;

use App\Filament\Resources\QuizRequestResource\Pages;
use App\Models\QuizRequest;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;

class QuizRequestResource extends Resource
{
    protected static ?string $model = QuizRequest::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-list';

    protected static ?string $navigationLabel = 'Quiz Requests';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('user_id')
                    ->relationship('user', 'name')
                    ->required()
                    ->disabled()
                    ->dehydrated(),
                Forms\Components\Select::make('subject_id')
                    ->relationship('subject', 'name')
                    ->required()
                    ->disabled()
                    ->dehydrated(),
                Forms\Components\Textarea::make('question_text')
                    ->required()
                    ->label('Question')
                    ->disabled()
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('option_a')
                    ->required()
                    ->label('Option A')
                    ->disabled()
                    ->maxLength(255),
                Forms\Components\TextInput::make('option_b')
                    ->required()
                    ->label('Option B')
                    ->disabled()
                    ->maxLength(255),
                Forms\Components\TextInput::make('option_c')
                    ->required()
                    ->label('Option C')
                    ->disabled()
                    ->maxLength(255),
                Forms\Components\TextInput::make('option_d')
                    ->required()
                    ->label('Option D')
                    ->disabled()
                    ->maxLength(255),
                Forms\Components\Radio::make('correct_answer')
                    ->required()
                    ->label('Correct Answer')
                    ->disabled()
                    ->options([
                        'a' => 'Option A',
                        'b' => 'Option B',
                        'c' => 'Option C',
                        'd' => 'Option D',
                    ])
                    ->inline(),
                Forms\Components\Select::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'approved' => 'Approved',
                        'rejected' => 'Rejected',
                    ])
                    ->disabled(),
                Forms\Components\Textarea::make('admin_notes')
                    ->label('Admin Notes')
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Submitted By')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('subject.name')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('question_text')
                    ->limit(60)
                    ->searchable()
                    ->label('Question'),
                Tables\Columns\BadgeColumn::make('status')
                    ->colors([
                        'warning' => 'pending',
                        'success' => 'approved',
                        'danger' => 'rejected',
                    ]),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Submitted'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'approved' => 'Approved',
                        'rejected' => 'Rejected',
                    ]),
                Tables\Filters\SelectFilter::make('subject')
                    ->relationship('subject', 'name'),
            ])
            ->defaultSort('created_at', 'desc')
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\Action::make('approve')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->requiresConfirmation()
                    ->visible(fn(QuizRequest $record) => $record->status === 'pending')
                    ->action(function (QuizRequest $record) {
                        $record->approve(auth()->id());
                        Notification::make()
                            ->success()
                            ->title('Quiz Request Approved')
                            ->body('The question has been added to the quiz pool.')
                            ->send();
                    }),
                Tables\Actions\Action::make('reject')
                    ->icon('heroicon-o-x-circle')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->visible(fn(QuizRequest $record) => $record->status === 'pending')
                    ->form([
                        Forms\Components\Textarea::make('admin_notes')
                            ->label('Rejection Reason')
                            ->required(),
                    ])
                    ->action(function (QuizRequest $record, array $data) {
                        $record->reject(auth()->id(), $data['admin_notes']);
                        Notification::make()
                            ->success()
                            ->title('Quiz Request Rejected')
                            ->send();
                    }),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListQuizRequests::route('/'),
        ];
    }
}
