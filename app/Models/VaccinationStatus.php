<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VaccinationStatus extends Model
{
    CONST COMPLETED = 1;
    CONST PENDING = 2;
    CONST PENDING_DOSE = 3;
    CONST PENDING_PAYMENT = 4;
    CONST EXPIRED = 5;
    CONST CANCELLED = 6;
    use HasFactory;
}
