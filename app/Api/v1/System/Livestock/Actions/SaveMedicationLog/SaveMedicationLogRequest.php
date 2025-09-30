<?php

namespace App\Api\v1\System\Livestock\Actions\SaveMedicationLog;

use Illuminate\Foundation\Http\FormRequest;

class SaveMedicationLogRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'farmId' => 'required',
            'livestockId' => 'required',
            'medicineId' => 'required',
            'diseaseId' => 'required',
            'date' => 'required',
            'quantity' => 'required',
            'quantityUnitId' => 'required',
            'withdrawalPeriod'=>'required',
            'withdrawalPeriodUnitId' => 'required',
            'remarks' => 'required',
        ];
    }
}
