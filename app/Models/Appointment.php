<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    use HasFactory;

        protected $fillable = [
            'patient_id',
            'doctor_id',
            'previous_appointment_id',
            'appointment_date',
            'start_time',
            'end_time',
            'location',
            'status',
            'price',
        ];


        public function patient()
        {
            return $this->belongsTo(Patient::class);
        }


        public function doctor()
        {
            return $this->belongsTo(Doctor::class);
        }
        public function previousAppointment()
    {
        return $this->belongsTo(Appointment::class, 'previous_appointment_id');
    }
    }

