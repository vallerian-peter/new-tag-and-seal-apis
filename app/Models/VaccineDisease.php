<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccineDisease extends Model
{
    use HasFactory;

    protected $table = 'vaccine_diseases';

    protected $fillable = [
        'vaccine_id',
        'disease_id',
        'created_by',
        'updated_by',
    ];

    // Relationships
    public function vaccine()
    {
        return $this->belongsTo(Vaccine::class);
    }

    public function disease()
    {
        return $this->belongsTo(Disease::class);
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }
}
