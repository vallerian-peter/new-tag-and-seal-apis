<?php

namespace App\Http\Requests\ExtensionOfficer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class SaveLogVaccinationFormRequest extends FormRequest
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
            'farm_id' => 'required',
            'livestock_id' => 'required',
            'vaccine_id' => 'required',
            'diseases_id' => 'required',
            'batch_no' => 'required',
            'quantity_administered' => 'required',
            'administration_route' => 'required',
            'rate'=>'required',
            'vet_id' => 'nullable',
            'officer_id' => 'nullable',
            'vaccination_date' => 'required',
            'next_vaccination_date' => 'required',
            'remarks' => 'required'
        ];
    }
}
