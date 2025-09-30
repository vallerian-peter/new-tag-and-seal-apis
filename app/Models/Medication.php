<?php

namespace App\Models;

use App\Traits\SyncableTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medication extends Model
{
    use HasFactory, SyncableTrait;

    protected $fillable = [
        'farm_id',
        'livestock_id',
        'disease_id',
        'medicine_id',
        'quantity',
        'quantity_unit_id',
        'withdrawal_period',
        'withdrawal_period_unit_id',
        'medication_date',
        'remarks',
        'vet_id',
        'created_by',
        'updated_by',
        'state_id',
        // Sync fields
        'uuid',
        'last_modified_at',
        'sync_status',
        'device_id',
        'original_created_at'
    ];

    protected $dates = ['last_modified_at', 'original_created_at', 'deleted_at', 'medication_date'];

    /**
     * Get significant fields for conflict detection
     */
    protected function getSignificantFields()
    {
        return [
            'farm_id' => $this->farm_id,
            'livestock_id' => $this->livestock_id,
            'disease_id' => $this->disease_id,
            'medicine_id' => $this->medicine_id,
            'quantity' => $this->quantity,
            'quantity_unit_id' => $this->quantity_unit_id,
            'withdrawal_period' => $this->withdrawal_period,
            'withdrawal_period_unit_id' => $this->withdrawal_period_unit_id,
            'medication_date' => $this->medication_date,
            'remarks' => $this->remarks,
            'vet_id' => $this->vet_id,
        ];
    }
}
