<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccineStatus extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'color',
    ];

    public function vaccines()
    {
        return $this->hasMany(Vaccine::class);
    }
}
