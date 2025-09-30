<?php

namespace App\Models;

use App\Models\System\State;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LivestockStage extends Model
{
    CONST CALF = 1;
    CONST COW = 2;
    CONST NEWBORN = 3;
    CONST HEIFER = 4;
    CONST YEARLING = 5;
    CONST MATURE = 6;
    CONST HOLSTEIN = 7;
    CONST JERSEY = 8;
    CONST WEANING = 9;
    CONST PEAK_LACTATION = 10;
    CONST DRY_COW = 11;
    CONST BULL = 12;
    CONST STEER = 13;

    use HasFactory;

    protected $fillable = [
        'livestock_id', 'stage_id', 'start_date', 'end_date', 'created_by', 'updated_by', 'state_id', 'created_at', 'updated_at'
    ];

    public function livestock()
    {
        return $this->belongsTo(Livestock::class, 'livestock_id');
    }

    public function stage()
    {
        return $this->belongsTo(Stage::class, 'stage_id');
    }

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }
}
