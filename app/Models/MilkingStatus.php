<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MilkingStatus extends Model
{
    CONST COMPLETED = 1;
    CONST PENDING = 2;
    CONST CANCELLED = 3;
    use HasFactory;
}
