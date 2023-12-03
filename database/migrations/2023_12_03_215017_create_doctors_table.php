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
        Schema::create('doctors', function (Blueprint $table) {
            $table->id();

            $table->string('f_name');

            $table->string('l_name');

            $table->string('email')->unique();

            $table->string('password');

            $table->string('specialist');

            $table->string('phone')->nullable()->unique();

            $table->string('address')->nullable();

            $table->string('city')->nullable();

            $table->string('state')->nullable();

            $table->string('country')->nullable();

            $table->date('birth_date')->nullable();

            $table->enum('gender', ['male', 'female'])->default('male');

            $table->string('profile_photo_path', 2048)->nullable();

            $table->float('price',6,2);

            $table->float('exp',4,2);

            $table->float('rate',2,1);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('doctors');
    }
};
