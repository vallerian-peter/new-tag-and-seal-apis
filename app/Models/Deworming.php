<?php

namespace App\Models;

use App\Traits\SyncableTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deworming extends Model
{
    use HasFactory, SyncableTrait;

    protected $fillable = [
        'reference_no',
        'dose',
        'farm_id',
        'livestock_id',
        'medicine_id',
        'quantity',
        'quantity_unit_id',
        'administration_route',
        'next_administration_date',
        'remarks',
        'vet_id',
        'extension_officer_id',
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

    protected $dates = ['last_modified_at', 'original_created_at', 'deleted_at', 'next_administration_date'];

    /**
     * Get significant fields for conflict detection
     */
    protected function getSignificantFields()
    {
        return [
            'reference_no' => $this->reference_no,
            'dose' => $this->dose,
            'farm_id' => $this->farm_id,
            'livestock_id' => $this->livestock_id,
            'medicine_id' => $this->medicine_id,
            'quantity' => $this->quantity,
            'quantity_unit_id' => $this->quantity_unit_id,
            'administration_route' => $this->administration_route,
            'next_administration_date' => $this->next_administration_date,
            'remarks' => $this->remarks,
            'vet_id' => $this->vet_id,
            'extension_officer_id' => $this->extension_officer_id,
        ];
    }
}
