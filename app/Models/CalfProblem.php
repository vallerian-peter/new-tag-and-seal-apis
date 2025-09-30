<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalfProblem extends Model
{
    use HasFactory;
    protected $fillable = [
        'calf_id',
'calf_problem_type_id',
'remarks',
'created_by',
'updated_by',
'state_id',
'created_at',
'updated_at'

    ];

    public function calfProblemType()
    {
        return $this->belongsTo(CalfProblemType::class, 'calf_problem_type_id');
    }

    public function calf()
    {
        return $this->belongsTo(Calf::class, 'calf_id');
    }
}
