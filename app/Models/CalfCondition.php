<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalfCondition extends Model
{
    use HasFactory;

    protected $fillable = [
        'calf_id',
        'calf_condition_type_id',
        'remarks',
        'created_by',
        'updated_by',
        'state_id',
        'created_at',
        'updated_at'
    ];

    public function calfConditionType()
    {
        return $this->belongsTo(CalfConditionType::class, 'calf_condition_type_id');
    }
}
