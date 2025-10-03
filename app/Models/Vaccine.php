<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Vaccine extends Model
{
    use HasFactory;

    protected $fillable = [
        'uuid', // Added for sync
        'name',
        'farm_id',
        'lot',
        'formulation_type', // e.g., 'live-attenuated', 'inactivated'
        'dose',
        'created_by',
        'updated_by',
        'vaccine_status_id', // foreign key to vaccine status
        'vaccine_type_id',   // foreign key to vaccine type
        'vaccine_schedule_id', // foreign key to vaccine schedule
        'created_at', // Added for sync
        'updated_at', // Added for sync
        // These fields are for frontend sync logic and will be handled in controller, not directly persisted
        'last_modified_at',
        'sync_status',
        'device_id',
        'original_created_at',
        'is_soft_deleted',
        'pending_action',
    ];

    // No soft delete columns - only uuid and updated_at in database

    /**
     * The "booting" method of the model.
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->uuid)) {
                $model->uuid = (string) Str::uuid();
            }
        });
    }

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
