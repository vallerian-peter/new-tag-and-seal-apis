<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DryingOff extends Model
{
    use HasFactory;
    protected $fillable = [
        'reference_no',
        'farm_id',
        'livestock_id',
        'serial',
        'start_date',
        'end_date',
        'expected_calving_date',
        'created_by',
        'updated_by',
        'state_id',
        'created_at',
        'updated_at'
    ];
}
