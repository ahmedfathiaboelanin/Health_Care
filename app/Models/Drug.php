<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Drug extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'description',
        'history_id',
    ];

    public function drugComponents()
    {
        return $this->hasMany(DrugComponent::class);
    }

    public function patients()
    {
    return $this->belongsToMany(Patient::class, 'patient_drug')
        ->withPivot(['dosage_form', 'dosage', 'frequency', 'start_date', 'end_date'])
        ->withTimestamps();
    }
    public function PatientHistory(){
    {
        return $this->belongsToMany(PatientHistory::class);
    }
}

}





//  Attaching a drug to a patient
// $patient = Patient::find(1);
// $drug = Drug::find(1);
// $patient->drugs()->attach($drug, [
//     'dosage_form' => 'Tablet',
//     'dosage' => '10mg',
//     'frequency' => 'Twice daily',
//     'start_date' => now(),
// ]);

// // Detaching a drug from a patient
// $patient->drugs()->detach($drug);

// // Syncing drugs for a patient (replaces existing relationships)
// $patient->drugs()->sync([1, 2, 3], [
//     1 => ['dosage_form' => 'Tablet', 'dosage' => '10mg', 'frequency' => 'Twice daily', 'start_date' => now()],
//     2 => ['dosage_form' => 'Capsule', 'dosage' => '20mg', 'frequency' => 'Once daily', 'start_date' => now()],
//     // ...
// ]);
