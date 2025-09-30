<?php

namespace App\Models;

use App\Models\Status;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class ExtensionOfficer extends Model
{
    use HasFactory;

    protected $fillable = [
        'registration_no', 
        'name', 
        'phone_1', 
        'phone_2', 
        'email', 
        'address', 
        'medical_licence_no', 
        'date_of_birth', 
        'gender_id',
        'identity_card_type_id', 
        'identity_number', 
        'street_id', 
        'school_level_id', 
        'village_id',
        'ward_id', 
        'division_id', 
        'district_id', 
        'region_id', 
        'country_id', 
        'farmer_type_id', 
        'created_by',
        'updated_by', 
        'status_id', '
        is_verified', 
        'created_at', 
        'updated_at'
    ];

    public function gender()
    {
        return $this->belongsTo(Gender::class, 'gender_id');
    }

    public function idCardType()
    {
        return $this->belongsTo(IdentityCardType::class, 'identity_card_type_id');
    }

    public function street()
    {
        return $this->belongsTo(Street::class, 'street_id');
    }

    public function schoolLevel()
    {
        return $this->belongsTo(SchoolLevel::class, 'school_level_id');
    }

    public function village()
    {
        return $this->belongsTo(Village::class, 'village_id');
    }

    public function ward()
    {
        return $this->belongsTo(Ward::class, 'ward_id');
    }

    public function division()
    {
        return $this->belongsTo(Division::class, 'division_id');
    }

    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id');
    }

    public function region()
    {
        return $this->belongsTo(Region::class, 'region_id');
    }

    public function district()
    {
        return $this->belongsTo(District::class, 'district_id');
    }

    public function status()
    {
        return $this->belongsTo(Status::class, 'status_id');
    }

    public function attachments()
    {
        return $this->hasMany(ExtensionOfficerAttachment::class, 'extension_officer_id');
    }

    public function farms()
    {
        return $this->hasMany(ExtensionOfficerFarm::class, 'extension_officer_id');
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
