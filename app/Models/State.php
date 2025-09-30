<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    CONST ACTIVE = 1;
    CONST INACTIVE = 2;
    use HasFactory;
}
