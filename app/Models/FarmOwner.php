<?php

namespace App\Models;

use App\Models\State;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class FarmOwner extends Model
{
    use HasFactory;

    protected $fillable = [
        'farmer_id', 'farm_id', 'assigned_by', 'created_at', 'updated_at', 'state_id'
    ];

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function farmer()
    {
        return $this->belongsTo(Farmer::class, 'farmer_id');
    }

    public function farm()
    {
        return $this->belongsTo(Farm::class, 'farm_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }
}
