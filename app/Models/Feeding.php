<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feeding extends Model
{
    use HasFactory;

    protected $fillable = [
            'uuid',
            'reference_no',
            'farm_id',
            'livestock_id',
            'feeding_type_id',
            'amount',
            'remarks',
            'feeding_time',
            'created_by',
            'updated_by',
            'state_id',
            'created_at',
            'updated_at',
            'sync_status',
            'device_id',
            'original_created_at',
            'last_modifi'
    ];
}
