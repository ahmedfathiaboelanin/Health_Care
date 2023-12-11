<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Diseases extends Model
{
    use HasFactory;

    protected $table = "diseases";
    protected $fillable = [
        "Description",
        "Disease",
        "Specialist",
        "precaution_1",	
        "precaution_2",	
        "precaution_3",	
        "precaution_4"
    ];
}
