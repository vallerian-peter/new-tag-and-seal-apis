<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Farm extends Model
{
    use HasFactory;

    protected $fillable = [
        'reference_no', 'name', 'size', 'size_unit_id', 'latitudes', 'longitudes', 'physical_address', 'created_at', 'updated_at', 'livestock_type_id',
        'street_id', 'village_id', 'ward_id', 'division_id', 'district_id', 'region_id', 'country_id', 'created_by', 'updated_by', 'farm_status_id',
        'legal_status_id', 'regional_reg_no','gps', 'uuid'
    ];

    public function street()
    {
        return $this->belongsTo(Street::class, 'street_id');
    }

    public function livestocks()
    {
        return $this->hasMany(FarmLivestock::class, 'farm_id');
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
        return $this->belongsTo(FarmStatus::class, 'farm_status_id');
    }

    public function sizeUnit()
    {
        return $this->belongsTo(SizeUnit::class, 'size_unit_id');
    }

    public function machines()
    {
        return $this->hasMany(FarmMachine::class, 'farm_id');
    }

    public function vets()
    {
        return $this->hasMany(VetFarm::class, 'farm_id');
    }

    public function officers()
    {
        return $this->hasMany(ExtensionOfficerFarm::class, 'farm_id');
    }

    public function users()
    {
        return $this->hasMany(FarmUser::class, 'farm_id');
    }

    public function owners()
    {
        return $this->hasMany(FarmOwner::class, 'farm_id');
    }

    public function livestockTypes()
    {
        return $this->hasMany(FarmLivestockType::class, 'farm_id');
    }

    public function vaccinations()
    {
        return $this->hasMany(Vaccination::class, 'farm_id');
    }

    public function allocations()
    {
        return $this->hasMany(TagAllocation::class, 'farm_id');
    }

    public function farmTags()
    {
        return $this->hasMany(FarmTag::class, 'farm_id');
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
