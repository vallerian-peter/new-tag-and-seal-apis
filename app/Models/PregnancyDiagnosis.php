<?php

namespace App\Models;

use App\Traits\SyncableTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PregnancyDiagnosis extends Model
{
    use HasFactory, SyncableTrait;

    protected $table = 'pregnancy_diagnosis';

    protected $fillable = [
        'reference_no',
        'farm_id',
        'livestock_id',
        'serial',
        'test_result_id',
        'no_of_months',
        'test_date',
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

    protected $dates = ['last_modified_at', 'original_created_at', 'deleted_at', 'test_date'];

    /**
     * Get the test result that belongs to the pregnancy diagnosis.
     */
    public function testResult()
    {
        return $this->belongsTo(PregnancyDiagnosisTestResult::class, 'test_result_id');
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
            'serial' => $this->serial,
            'test_result_id' => $this->test_result_id,
            'no_of_months' => $this->no_of_months,
            'test_date' => $this->test_date,
            'remarks' => $this->remarks,
        ];
    }
}
