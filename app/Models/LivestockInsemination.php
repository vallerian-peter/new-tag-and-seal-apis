<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LivestockInsemination extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'livestock_inseminations';

    protected $fillable = [
        'uuid',
        'reference_no',
        'livestock_id',
        'serial',
        'last_heat_date',
        'current_heat_type_id',
        'insemination_date',
        'insemination_service_id',
        'insemination_semen_straw_type_id',
        'bull_code',
        'bull_breed',
        'semen_production_date',
        'production_country',
        'semen_batch_number',
        'international_id',
        'ai_code',
        'manufacturer_name',
        'semen_supplier',
        'state_id',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'last_modified_at',
        'sync_status',
        'device_id',
        'original_created_at',
    ];

    protected $dates = [
        'deleted_at',
        'last_heat_date',
        'insemination_date',
        'semen_production_date',
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
