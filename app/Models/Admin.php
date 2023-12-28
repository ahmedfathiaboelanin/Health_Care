<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'first_name',
        'last_name',
        'email',
        'image',
        'phone_number',
    ];
    public function user(){
        return $this->belongsTo(User::class , 'user_id');
    }
}
