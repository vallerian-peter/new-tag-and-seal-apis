<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calf extends Model
{
    use HasFactory;
    protected $fillable = [
        'calving_id',
        'gender_id',
        'created_by',
        'updated_by',
        'state_id',
        'created_at',
        'updated_at'
    ];
    protected $table = 'calfs';

    public function gender()
    {
        return $this->belongsTo(Gender::class, 'gender_id');
    }

    public function calfConditions()
    {
        return $this->hasMany(CalfCondition::class);
    }

    public function calfProblems()
    {
        return $this->hasMany(CalfProblem::class);
    }

    public function calfReproductiveProblems()
    {
        return $this->hasMany(CalfReproductiveProblem::class);
    }
}
