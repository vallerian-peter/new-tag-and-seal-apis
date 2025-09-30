<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccineBatch extends Model
{
    use HasFactory;

    protected $table = 'vaccine_batches';

    protected $fillable = [
        'vaccine_id',
        'batch_number',
        'quantity',
        'expiry_date',
        'quantity_uom_id',
        'created_by',
        'updated_by',
    ];

    // Relationships
    public function vaccine()
    {
        return $this->belongsTo(Vaccine::class);
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }
}
