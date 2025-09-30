<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Milking extends Model
{
    use HasFactory;

    protected $fillable = [
        'reference_no','livestock_id','amount','lactometer_reading','total_solids','solid','solid_non_fat','protein','corrected_lactometer_reading',
        'colony_forming_units','milking_status_id','milking_method_id','milking_session_id','milking_unit_id','acidity','created_at','created_by'
    ];
}
