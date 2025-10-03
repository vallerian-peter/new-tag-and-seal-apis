<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DryingOff extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'uuid',
        'reference_no',
        'farm_id',
        'livestock_id',
        'serial',
        'start_date',
        'end_date',
        'expected_calving_date',
        'created_by',
        'updated_by',
        'state_id',
        'created_at',
        'updated_at',
    ];

    protected $dates = [
        'deleted_at',
        'start_date',
        'end_date',
        'expected_calving_date',
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
