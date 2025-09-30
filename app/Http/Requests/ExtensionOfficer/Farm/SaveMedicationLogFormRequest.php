<?php

namespace App\Http\Requests\ExtensionOfficer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class SaveMedicationLogFormRequest extends FormRequest
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
            'medicine_id' => 'required',
            'disease_id' => 'required',
            'date' => 'required',
            'quantity' => 'required',
            'quantity_unit_id' => 'required',
            'withdrawal_period'=>'required',
            'withdrawal_period_unit_id' => 'required',
            'officer_id' => 'nullable',
            'vet_id' => 'nullable',
            'remarks' => 'required'
        ];
    }
}
