<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Patient extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'date_of_birth',
        'weight',
        'height',
        'image',
        'phone_number',
        'address',
    ];
    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
    public function drugs()
    {
    return $this->belongsToMany(Drug::class, 'patient_drug')
        ->withPivot(['dosage_form', 'dosage', 'frequency', 'start_date', 'end_date'])
        ->withTimestamps();
    }
    public function PatientHistory()
    {
        return $this->hasOne(PatientHistory::class);
    }
    public function doctors()
    {
        return $this->belongsToMany(Doctor::class);
    }
    public function appointments()
    {
        return $this->belongsToMany(Appointment::class);
    }
}
