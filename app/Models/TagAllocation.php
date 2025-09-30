<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class TagAllocation extends Model
{
    use HasFactory;

    protected $fillable = [
        'reference_no', 'tag_type_id', 'quantity', 'approved_quantity', 'farmer_id',
        'farm_id', 'date_requested', 'date_allocated', 'usage_status_id', 'remarks',
        'created_at', 'updated_at', 'tag_allocation_status_id', 'created_by', 'updated_by',
        'processed_by'
    ];

    public function tagType()
    {
        return $this->belongsTo(TagType::class, 'tag_type_id');
    }

    public function farmer()
    {
        return $this->belongsTo(Farmer::class, 'farmer_id');
    }

    public function farm()
    {
        return $this->belongsTo(Farm::class, 'farm_id');
    }

    public function status()
    {
        return $this->belongsTo(TagAllocationStatus::class, 'tag_allocation_status_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }

    public function processedBy()
    {
        return $this->belongsTo(User::class, 'processed_by')->select('system_users.*')->join('system_users', 'system_users.id', '=', 'users.profile_id')->where('profile', 'SystemUser');
    }
}
