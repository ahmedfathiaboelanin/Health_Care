<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DrugComponent extends Model
{
    use HasFactory;
    protected $fillable = [
        'components',
        'drug_id',
    ];

    public function drug()
    {
        return $this->belongsTo(Drug::class);
    }
}
