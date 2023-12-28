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
        Schema::create('patient_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('patient_id')->constrained('patients')->onDelete('cascade');
            $table->date('date');
            $table->text('comment')->nullable();
            $table->text('treatment')->nullable();
            $table->string('diagnosis')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patient_histories');
    }
};
