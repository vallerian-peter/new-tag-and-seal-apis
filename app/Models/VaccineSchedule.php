<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccineSchedule extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'interval_days',
    ];

    public function vaccines()
    {
        return $this->hasMany(Vaccine::class);
    }
}
