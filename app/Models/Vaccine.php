<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vaccine extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'farm_id',
        'lot',
        'formulation_type', // e.g., 'live-attenuated', 'inactivated'
        'dose',
        'created_by',
        'updated_by',
        'vaccine_status_id', // foreign key to vaccine status
        'vaccine_type_id',   // foreign key to vaccine type
        'vaccine_schedule_id' // foreign key to vaccine schedule
    ];

    // Relationships
    public function farm()
    {
        return $this->belongsTo(Farm::class);
    }

    public function status()
    {
        return $this->belongsTo(VaccineStatus::class, 'vaccine_status_id');
    }

    public function type()
    {
        return $this->belongsTo(VaccineType::class, 'vaccine_type_id');
    }

    public function schedule()
    {
        return $this->belongsTo(VaccineSchedule::class, 'vaccine_schedule_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function batches()
    {
        return $this->hasMany(VaccineBatch::class);
    }
}
