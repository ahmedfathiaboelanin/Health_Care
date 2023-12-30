<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PhoneNumber extends Model
{
    use HasFactory;
    protected $fillable = [
        'doctor_id',
        'phone_number',
    ];

    public function doctor()
    {
        return $this->belongsTo(Doctor::class);
    }
}
