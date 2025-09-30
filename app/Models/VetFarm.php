<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\System\State;
use App\Models\User;

class VetFarm extends Model
{
    use HasFactory;

    protected $fillable = [
        'vet_id', 'farm_id', 'state_id', 'assigned_by', 'created_at', 'updated_at'
    ];

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function farm()
    {
        return $this->belongsTo(Farm::class, 'farm_id');
    }

    public function vet()
    {
        return $this->belongsTo(Vet::class, 'vet_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'assigned_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }
}
