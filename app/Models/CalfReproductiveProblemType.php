<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalfReproductiveProblemType extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'name',
        'color',
        'created_at',
        'updated_at',
    ];
}
