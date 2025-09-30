<?php

namespace App\Models;

use App\Models\System\State;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Attachment extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'path', 'created_at', 'updated_at', 'size', 'created_by', 'updated_by','attachment_type_id'
    ];

    public function attachmentType()
    {
        return $this->belongsTo(AttachmentType::class, 'attachment_type_id');
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
