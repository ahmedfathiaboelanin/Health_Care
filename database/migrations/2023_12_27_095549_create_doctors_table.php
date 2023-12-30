<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */public function up()
{
    Schema::create('doctors', function (Blueprint $table) {
        $table->id();
        $table->unsignedInteger('doctor_personal_id')->unique(); // id for work or national id
        $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
        $table->string('first_name');
        $table->string('middle_name');
        $table->string('last_name');
        $table->string('specialization');
        $table->string('email');
        $table->timestamp('email_verified_at')->nullable();
        $table->decimal('rate', 8, 2);
        $table->decimal('price', 8, 2);
        $table->decimal('re-examination_price', 8, 2)->default(0.00); //سعر اعاده الكشف
        $table->string('image');
        $table->unsignedInteger('age');
        $table->text('description')->nullable(); // نبذه عن الدكتور
        // Work Time 1
        $table->string('from1'); //from day
        $table->string('to1'); //to day
        $table->string('street1');
        $table->string('city1');
        $table->string('governament1');
        $table->time('start_time1');
        $table->time('end_time1');
        // Work Time 2 (nullable)
        $table->string('from2')->nullable(); //from day
        $table->string('to2')->nullable(); //to day
        $table->string('street2')->nullable();
        $table->string('city2')->nullable();
        $table->string('governament2')->nullable();
        $table->time('start_time2')->nullable();
        $table->time('end_time2')->nullable();
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
