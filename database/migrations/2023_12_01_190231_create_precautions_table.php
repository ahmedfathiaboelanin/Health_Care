<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('precautions', function (Blueprint $table) {
            $table->id();
            $table->string('Disease')->unique();
            $table->string('precaution_1')->nullable();
            $table->string('precaution_2')->nullable();
            $table->string('precaution_3')->nullable();
            $table->string('precaution_4')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('precautions');
    }
};
