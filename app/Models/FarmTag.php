<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\State;
use App\Models\User;

class FarmTag extends Model
{
    use HasFactory;

    protected $fillable = [
        'farm_id', 'tag_id', 'allocation_id', 'allocated_by', 'state_id', 'created_at', 'updated_at'
    ];

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function farm()
    {
        return $this->belongsTo(Farm::class, 'farm_id');
    }

    public function tag()
    {
        return $this->belongsTo(Tag::class, 'tag_id');
    }

    public function allocation()
    {
        return $this->belongsTo(TagAllocation::class, 'allocation_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }

    public function allocatedBy()
    {
        return $this->belongsTo(User::class, 'allocated_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }
}
