<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccinationDose extends Model
{
    use HasFactory;
    protected $fillable = [
        'vaccination_id','batch_number','quantity_administered','administration_route',
        'rate','vaccination_date','remarks','next_administration_date','vet_id',
        'created_by','state_id'
    ];

    // Relationships
    public function vaccination(){
        return $this->belongsTo(Vaccination::class);
    }

    public function vet(){
        return $this->belongsTo(User::class, 'vet_id');
    }

    public function createdBy(){
        return $this->belongsTo(User::class, 'created_by');
    }
}
