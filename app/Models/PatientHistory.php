<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientHistory extends Model
{
    use HasFactory;
    protected $fillable = [
        'date',
        'comment',
        'treatment',
        'diagnosis'
    ];

    public function diseases()
    {
        return $this->belongsToMany(Disease::class);
    }
    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }
    public function drugs()
    {
        return $this->belongsToMany(Drug::class);
    }
}
