<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalvingType extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'color',
        'created_at',
        'updated_at'
    ];
}
