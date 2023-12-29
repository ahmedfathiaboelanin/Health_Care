<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Doctor extends Model
{
    use HasFactory;
    protected $fillable = [
        'doctor_personal_id',
        'user_id',
        'specialization',
        'rate',
        'price',
        're-examination_price',
        'image',
        'age',
        'description',
        'from1',
        'to1',
        'street1',
        'city1',
        'governament1',
        'start_time1',
        'end_time1',
        'from2',
        'to2',
        'street2',
        'city2',
        'governament2',
        'start_time2',
        'end_time2',
    ];
    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
    public function patients()
    {
        return $this->belongsToMany(Patient::class);
    }
    public function appointments()
    {
        return $this->belongsToMany(Appointment::class);
    }
    public function phoneNumbers()
    {
        return $this->hasMany(PhoneNumber::class);
    }

}
