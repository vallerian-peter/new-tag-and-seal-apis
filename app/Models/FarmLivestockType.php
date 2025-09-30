<?php

namespace App\Models;

use App\Models\State;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class FarmLivestockType extends Model
{
    use HasFactory;

    protected $fillable = [
        'farm_id', 'livestock_type_id', 'state_id', 'created_at', 'created_by', 'updated_at', 'updated_by'
    ];

    public function farm()
    {
        return $this->belongsTo(Farm::class, 'farm_id');
    }

    public function livestockType()
    {
        return $this->belongsTo(LivestockType::class, 'livestock_type_id');
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
