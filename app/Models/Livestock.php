<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Livestock extends Model
{
    use HasFactory;

    protected $fillable = [
        'identification_number',
        'livestock_type_id',
        'name',
        'date_of_birth',
        'mother_id',
        'father_id',
        'gender_id',
        'livestock_obtained_method_id',
        'date_first_entered_to_farm',
        'weight_as_on_registration',
        'total_milk_produced',
        'parity_lactacting_number',
        'date_of_last_calving',
        'breed_id',
        'species_id',
        'created_by',
        'updated_by',
        'livestock_status_id',
        'created_at',
        'updated_at'
    ];

    public function gender()
    {
        return $this->belongsTo(Gender::class, 'gender_id');
    }

    public function farm()
    {
        return $this->hasOne(FarmLivestock::class, 'livestock_id');
    }

    public function livestockType()
    {
        return $this->belongsTo(LivestockType::class, 'livestock_type_id');
    }

    public function mother()
    {
        return $this->belongsTo(Livestock::class, 'mother_id');
    }

    public function father()
    {
        return $this->belongsTo(Livestock::class, 'father_id');
    }

    public function breed()
    {
        return $this->belongsTo(Breed::class, 'breed_id');
    }

    public function species()
    {
        return $this->belongsTo(Specie::class, 'species_id');
    }

    public function status()
    {
        return $this->belongsTo(LivestockStatus::class, 'livestock_status_id');
    }

    public function attachments()
    {
        return $this->hasMany(LivestockAttachment::class, 'livestock_id');
    }

    public function livestockStages()
    {
        return $this->hasMany(LivestockStage::class, 'livestock_id');
    }

    public function vaccinations()
    {
        return $this->hasMany(Vaccination::class, 'livestock_id');
    }

    public function milkings()
    {
        return $this->hasMany(Milking::class, 'livestock_id');
    }

    public function healthConditions()
    {
        return $this->hasMany(HealthCondition::class, 'livestock_id');
    }

    public function tags()
    {
        return $this->hasMany(LivestockTag::class, 'livestock_id');
    }

    public function medications()
    {
        return $this->hasMany(Medication::class, 'livestock_id');
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
