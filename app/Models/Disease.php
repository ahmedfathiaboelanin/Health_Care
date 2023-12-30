<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Disease extends Model
{
    use HasFactory;

    protected $table ="diseases";
    protected $fillable = [
        'name',
        'description',
        'specialist',
    ];
    public function patientHistories()
    {
        return $this->belongsToMany(PatientHistory::class);
    }
}
