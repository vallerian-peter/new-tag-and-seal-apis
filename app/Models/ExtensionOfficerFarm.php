<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\State;
use App\Models\User;

class ExtensionOfficerFarm extends Model
{
    use HasFactory;

    protected $fillable = [
        'extension_officer_id', 'farm_id', 'state_id', 'assigned_by', 'created_at', 'updated_at'
    ];

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function farm()
    {
        return $this->belongsTo(Farm::class, 'farm_id');
    }

    public function extensionOfficer()
    {
        return $this->belongsTo(ExtensionOfficer::class, 'extension_officer_id');
    }

    public function assignedByUser()
    {
        return $this->belongsTo(User::class, 'assigned_by');
    }
}
