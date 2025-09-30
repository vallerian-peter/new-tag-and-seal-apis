<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    CONST TANZANIA = 1;
    use HasFactory;

    protected $fillable = [
        'name', 'short_name', 'created_at', 'updated_at'
    ];
}
