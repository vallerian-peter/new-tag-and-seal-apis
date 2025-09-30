<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WeightUnit extends Model
{
    CONST TONS = 1;
    CONST KILOGRAMS = 2;
    CONST GRAMS = 2;
    use HasFactory;
}
