<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FarmVaccine extends Model
{
    use HasFactory;

    protected $fillable = [
        'farm_id',
        'vaccine_id',
        'quantity',
        'expiry_date',
    ];

    public function farm()
    {
        return $this->belongsTo(Farm::class);
    }

    public function vaccine()
    {
        return $this->belongsTo(Vaccine::class);
    }
}
