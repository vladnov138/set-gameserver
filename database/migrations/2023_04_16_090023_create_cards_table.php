<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Query\Expression;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('cards', function (Blueprint $table) {
            $table->id();
            $table->integer('room_id')
                        ->unique();
            $table->json('cards')
                        ->default(new Expression('(JSON_ARRAY())'))
                        ->nullable();
            $table->json('field_cards')
                        ->default(new Expression('(JSON_ARRAY())'))
                        ->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cards');
    }
};
