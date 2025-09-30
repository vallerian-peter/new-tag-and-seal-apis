<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AnimalDisposal extends Model
{
    use HasFactory;
    protected $fillable = [
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
'updated_at'

    ];
}
