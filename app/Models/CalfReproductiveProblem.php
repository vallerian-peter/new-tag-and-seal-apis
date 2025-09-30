<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalfReproductiveProblem extends Model
{
    use HasFactory;
    protected $fillable = [
        'calf_id',
        'problem_type_id',
        'remarks',
        'created_by',
        'updated_by',
        'state_id',
        'created_at',
        'updated_at'
    ];

    public function reproductiveProblemType()
    {
        return $this->belongsTo(CalfReproductiveProblemType::class, 'problem_type_id');
    }

    public function calf()
    {
        return $this->belongsTo(Calf::class, 'calf_id');
    }
}
