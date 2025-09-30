<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FarmerStatus extends Model
{
    use HasFactory;
    CONST ACTIVE = 1;
    CONST PENDING = 2;
    CONST INACTIVE = 3;
}
