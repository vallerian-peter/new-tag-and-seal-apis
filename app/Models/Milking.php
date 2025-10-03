<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Milking extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'uuid',
        'reference_no',
        'livestock_id',
        'amount',
        'lactometer_reading',
        'total_solids',
        'solid',
        'solid_non_fat',
        'protein',
        'corrected_lactometer_reading',
        'colony_forming_units',
        'milking_status_id',
        'milking_method_id',
        'milking_session_id',
        'milking_unit_id',
        'acidity',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at'
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
