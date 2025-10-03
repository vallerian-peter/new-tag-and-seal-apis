<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AnimalDisposal extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'uuid',
        'reference_no',
        'farm_id',
        'livestock_id',
        'animal_disposal_type_id',
        'reasons',
        'remarks',
        'meat_obtaines',
        'vet_id',
        'extension_officer_id',
        'created_by',
        'updated_by',
        'state_id',
        'created_at',
        'updated_at',
        'last_modified_at',
        'sync_status',
        'device_id',
        'original_created_at',
    ];

    protected $dates = [
        'deleted_at',
    ];

    /**
     * Generate UUID if not provided
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->uuid)) {
                $model->uuid = \Illuminate\Support\Str::uuid()->toString();
            }
        });
    }
}
