<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WeightGain extends Model
{
    use HasFactory;
    protected $fillable = [
        'reference_no',
        'farm_id',
'livestock_id',
'weight',
'weight_gain',
'weight_gain_unit_id',
'remarks',
'created_by',
'updated_by',
'state_id',
'created_at',
'updated_at'

    ];
}
