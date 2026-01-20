<?php

namespace App\Filament\Resources;

use App\Filament\Resources\QuestionResource\Pages;
use App\Filament\Resources\QuestionResource\RelationManagers;
use App\Models\Question;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class QuestionResource extends Resource
{
    protected static ?string $model = Question::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('subject_id')
                    ->relationship('subject', 'name')
                    ->required()
                    ->searchable(),
                Forms\Components\Textarea::make('question_text')
                    ->required()
                    ->label('Question')
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('option_a')
                    ->required()
                    ->label('Option A')
                    ->maxLength(255),
                Forms\Components\TextInput::make('option_b')
                    ->required()
                    ->label('Option B')
                    ->maxLength(255),
                Forms\Components\TextInput::make('option_c')
                    ->required()
                    ->label('Option C')
                    ->maxLength(255),
                Forms\Components\TextInput::make('option_d')
                    ->required()
                    ->label('Option D')
                    ->maxLength(255),
                Forms\Components\Radio::make('correct_answer')
                    ->required()
                    ->label('Correct Answer')
                    ->options([
                        'a' => 'Option A',
                        'b' => 'Option B',
                        'c' => 'Option C',
                        'd' => 'Option D',
                    ])
                    ->inline()
                    ->inlineLabel(false),
                Forms\Components\Toggle::make('is_active')
                    ->default(true)
                    ->label('Active'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('subject.name')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('question_text')
                    ->limit(50)
                    ->searchable()
                    ->label('Question'),
                Tables\Columns\TextColumn::make('correct_answer')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'a' => 'success',
                        'b' => 'info',
                        'c' => 'warning',
                        'd' => 'danger',
                    })
                    ->formatStateUsing(fn(string $state): string => strtoupper($state)),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean()
                    ->label('Active'),
                Tables\Columns\TextColumn::make('creator.name')
                    ->label('Created By')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('subject')
                    ->relationship('subject', 'name'),
                Tables\Filters\Filter::make('is_active')
                    ->query(fn(Builder $query): Builder => $query->where('is_active', true))
                    ->label('Active Only'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListQuestions::route('/'),
            'create' => Pages\CreateQuestion::route('/create'),
            'edit' => Pages\EditQuestion::route('/{record}/edit'),
        ];
    }
}
