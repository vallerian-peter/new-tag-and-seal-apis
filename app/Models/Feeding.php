<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Feeding extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'uuid',
        'reference_no',
        'farm_id',
        'livestock_id',
        'feeding_type_id',
        'amount',
        'remarks',
        'feeding_time',
        'created_by',
        'updated_by',
        'state_id',
        'created_at',
        'updated_at'
    ];

    protected $dates = [
        'deleted_at',
        'feeding_time'
    ];

    // Relationships
    public function farm()
    {
        return $this->belongsTo(Farm::class, 'farm_id');
    }

    public function livestock()
    {
        return $this->belongsTo(Livestock::class, 'livestock_id');
    }

    public function feedingType()
    {
        return $this->belongsTo(FeedingType::class, 'feeding_type_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }
}
