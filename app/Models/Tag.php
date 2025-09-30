<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Tag extends Model
{
    use HasFactory;

    protected $fillable = [
        'tag_number', 'batch_serial_number', 'tag_type_id', 'tag_batch_id', 'created_by', 'updated_by', 'tag_status_id', 'created_at', 'updated_at'
    ];

    public function tagType()
    {
        return $this->belongsTo(TagType::class, 'tag_type_id');
    }

    public function status()
    {
        return $this->belongsTo(TagStatus::class, 'tag_status_id');
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
