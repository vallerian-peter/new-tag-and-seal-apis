<?php

namespace App\Http\Requests\ExtensionOfficer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class ExtensionOfficerRegisterFarmFormRequest extends FormRequest
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
            'name' => 'required',
            'regional_registration_number' => 'nullable',
            'latitudes' => 'required',
            'longitudes' => 'required',
            'physical_address' => 'required',
            'livestock_type' => 'required',
            'size' => 'required',
            'size_unit' => 'required',
            'region' => 'required',
            'district' => 'required',
            'legal_status' => 'required',
            'farmer_no' => 'required'
        ];
    }
}
