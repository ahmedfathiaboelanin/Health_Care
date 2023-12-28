<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DiseasePrecaution extends Model
{
    use HasFactory;
    protected $fillable = [
        'precaution',
        'disease_id',
    ];

    public function disease()
    {
        return $this->belongsTo(Disease::class);
    }
}
