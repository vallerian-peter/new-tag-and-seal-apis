<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LivestockInseminations extends Model
{
    use HasFactory;

    protected $table = 'livestock_inseminations';

    protected $fillable = [
        'id',
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
    ];

    /**
     * Get the heat type that belongs to the insemination.
     */
    public function heatType()
    {
        return $this->belongsTo(LivestockHeatType::class, 'current_heat_type_id');
    }

    /**
     * Get the current heat type that belongs to the insemination.
     */
    public function currentHeatType()
    {
        return $this->belongsTo(LivestockHeatType::class, 'current_heat_type_id');
    }

    /**
     * Get the insemination service that belongs to the insemination.
     */
    public function inseminationService()
    {
        return $this->belongsTo(LivestockInseminationServices::class, 'insemination_service_id');
    }

    /**
     * Get the semen straw type that belongs to the insemination.
     */
    public function semenStrawType()
    {
        return $this->belongsTo(LivestockInseminationSemenStrawTypes::class, 'insemination_semen_straw_type_id');
    }

    /**
     * Get the breed that belongs to the insemination.
     */
    public function breed()
    {
        return $this->belongsTo(Breed::class, 'bull_breed');
    }

    /**
     * Get the livestock that belongs to the insemination.
     */
    public function livestock()
    {
        return $this->belongsTo(Livestock::class, 'livestock_id');
    }
}
