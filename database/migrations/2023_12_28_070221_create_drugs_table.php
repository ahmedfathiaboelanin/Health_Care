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
        Schema::create('drugs', function (Blueprint $table) {
            $table->id();
            $table->string('components');
            $table->text('description')->nullable();//وصف
            $table->text('indications')->nullable();//دواعي الإستعمال
            $table->string('dosage_form')->nullable(); // نوع الجرعة للدواء، قابل للإلغاء
            $table->float('strength')->nullable(); // تركيز الدواء، قابل للإلغاء
            $table->boolean('prescription_required')->default(false); // هل الوصفة الطبية مطلوبة، الافتراضي إلى عدم الضرورة
            $table->text('prescription_notes')->nullable(); // ملاحظات إضافية حول الوصفة الطبية، قابل للإلغاء
            $table->string('frequency')->nullable(); // تكرار تناول الدواء، قابل للإلغاء
            $table->string('timing')->nullable(); // وقت تناول الدواء، قابل للإلغاء
            $table->string('duration')->nullable(); // مدة العلاج بالدواء، قابل للإلغاء
            $table->text('storage_instructions')->nullable(); // تعليمات التخزين للدواء، قابل للإلغاء
            $table->string('manufacturer_name')->nullable(); // اسم الشركة المصنعة للدواء، قابل للإلغاء
            $table->string('manufacturer_contact')->nullable(); // معلومات الاتصال بالشركة المصنعة، قابل للإلغاء
            $table->decimal('price', 8, 2)->nullable(); // سعر الدواء، قابل للإلغاء
            $table->text('common_side_effects')->nullable(); // آثار الجانبية الشائعة للدواء، قابل للإلغاء
            $table->text('severe_side_effects')->nullable(); // آثار الجانبية الخطيرة للدواء، قابل للإلغاء
            $table->text('contraindications')->nullable(); // الموانع لاستخدام الدواء، قابل للإلغاء
            $table->string('batch_or_serial_number')->nullable(); // رقم الدفعة أو السيريال للدواء، قابل للإلغاء
            $table->foreignId('history_id')->constrained('patient_histories')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('drugs');
    }
};
