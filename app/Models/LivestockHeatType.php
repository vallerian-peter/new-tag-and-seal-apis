<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LivestockHeatType extends Model
{
    use HasFactory;

    protected $table = 'livestock_heat_types';

    protected $fillable = [
        'id',
        'name',
        'color',
        'created_at',
        'updated_at'
    ];

    /**
     * Get the inseminations that use this heat type.
     */
    public function inseminations()
    {
        return $this->hasMany(LivestockInseminations::class, 'current_heat_type_id');
    }
}
