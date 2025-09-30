<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TagStatus extends Model
{
    CONST ACTIVE = 1;
    CONST PENDING = 2;
    CONST INACTIVE = 3;
    CONST ALLOCATED = 4;
    CONST ASSIGNED = 5;

    use HasFactory;
}
