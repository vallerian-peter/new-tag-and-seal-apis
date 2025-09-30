<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LivestockObtainedMethod extends Model
{
    CONST PURCHASED = 1;
    CONST BORN_ON_FARM = 2;
    CONST GIFT = 3;
    CONST DONATION = 4;

    use HasFactory;
}
