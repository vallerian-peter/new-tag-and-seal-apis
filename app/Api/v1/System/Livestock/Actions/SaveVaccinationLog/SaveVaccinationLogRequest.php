<?php

namespace App\Api\v1\System\Livestock\Actions\SaveVaccinationLog;

use Illuminate\Foundation\Http\FormRequest;

class SaveVaccinationLogRequest extends FormRequest
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
            'vaccineId' => 'required',
            'diseaseId' => 'required',
            'batchNo' => 'required',
            'quantityAdministered' => 'required',
            'administrationRoute' => 'required',
            'rate'=>'required',
            'vaccinationDate' => 'required',
            'nextVaccinationDate' => 'required',
            'remarks' => 'required'
        ];
    }
}
