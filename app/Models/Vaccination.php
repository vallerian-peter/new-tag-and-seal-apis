<?php

namespace App\Models;

use App\Traits\SyncableTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vaccination extends Model
{
    use HasFactory, SyncableTrait;

    protected $fillable = [
        'vaccination_no',
        'farm_id',
        'livestock_id',
        'vaccine_id',
        'disease_id',
        'vet_id',
        'extension_officer_id',
        'created_by',
        'vaccination_status_id',
        // Sync fields
        'uuid',
        'last_modified_at',
        'sync_status',
        'device_id',
        'original_created_at'
    ];

    protected $dates = ['last_modified_at', 'original_created_at', 'deleted_at'];

    // Relationships
    public function livestock(){
        return $this->belongsTo(Livestock::class);
    }

    public function vaccine(){
        return $this->belongsTo(Vaccine::class);
    }

    public function disease(){
        return $this->belongsTo(Disease::class);
    }

    public function vet(){
        return $this->belongsTo(User::class, 'vet_id');
    }

    public function extensionOfficer(){
        return $this->belongsTo(User::class, 'extension_officer_id');
    }

    public function status(){
        return $this->belongsTo(VaccinationStatus::class, 'vaccination_status_id');
    }

    public function createdBy(){
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy(){
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function doses(){
        return $this->hasMany(VaccinationDose::class);
    }

    /**
     * Get significant fields for conflict detection
     */
    protected function getSignificantFields()
    {
        return [
            'vaccination_no' => $this->vaccination_no,
            'farm_id' => $this->farm_id,
            'livestock_id' => $this->livestock_id,
            'vaccine_id' => $this->vaccine_id,
            'disease_id' => $this->disease_id,
            'vet_id' => $this->vet_id,
            'extension_officer_id' => $this->extension_officer_id,
            'vaccination_status_id' => $this->vaccination_status_id,
        ];
    }
}
