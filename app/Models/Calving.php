<?php

namespace App\Models;

use App\Traits\SyncableTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calving extends Model
{
    use HasFactory, SyncableTrait;

    protected $fillable = [
        'reference_no',
        'farm_id',
        'livestock_id',
        'calving_type_id',
        'calving_problems_id',
        'reproductive_problem_id',
        'remarks',
        'created_by',
        'updated_by',
        'state_id',
        // Sync fields
        'uuid',
        'last_modified_at',
        'sync_status',
        'device_id',
        'original_created_at'
    ];

    protected $dates = ['last_modified_at', 'original_created_at', 'deleted_at'];

    /**
     * Get the calving type that belongs to the calving.
     */
    public function calvingType()
    {
        return $this->belongsTo(CalvingType::class, 'calving_type_id');
    }

    /**
     * Get the calving problem that belongs to the calving.
     */
    public function calvingProblem()
    {
        return $this->belongsTo(CalfProblemType::class, 'calving_problems_id');
    }

    /**
     * Get the reproductive problem that belongs to the calving.
     */
    public function reproductiveProblem()
    {
        return $this->belongsTo(CalfReproductiveProblemType::class, 'reproductive_problem_id');
    }

    /**
     * Get the calves for the calving.
     */
    public function calfs()
    {
        return $this->hasMany(Calf::class, 'calving_id');
    }

    /**
     * Get significant fields for conflict detection
     */
    protected function getSignificantFields()
    {
        return [
            'reference_no' => $this->reference_no,
            'farm_id' => $this->farm_id,
            'livestock_id' => $this->livestock_id,
            'calving_type_id' => $this->calving_type_id,
            'calving_problems_id' => $this->calving_problems_id,
            'reproductive_problem_id' => $this->reproductive_problem_id,
            'remarks' => $this->remarks,
        ];
    }
}
