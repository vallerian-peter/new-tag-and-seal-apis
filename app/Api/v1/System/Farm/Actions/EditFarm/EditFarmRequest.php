<?php

namespace App\Api\v1\System\Farm\Actions\EditFarm;

use Illuminate\Foundation\Http\FormRequest;

class EditFarmRequest extends FormRequest
{
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
            'farm_id' => 'required|integer|exists:farms,id',
            'name' => 'nullable|string|max:255',
            'size' => 'nullable|numeric|min:0',
            'size_unit' => 'nullable|integer|exists:size_units,id',
            'physical_address' => 'nullable|string|max:500',
            'regional_registration_number' => 'nullable|string|max:255',
            'region' => 'nullable|integer|exists:regions,id',
            'district' => 'nullable|integer|exists:districts,id',
            'ward' => 'nullable|integer|exists:wards,id',
            'latitudes' => 'nullable|string|max:50',
            'longitudes' => 'nullable|string|max:50',
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'farm_id.required' => 'Farm ID is required.',
            'farm_id.exists' => 'Farm not found.',
            'name.max' => 'Farm name cannot exceed 255 characters.',
            'size.numeric' => 'Farm size must be a number.',
            'size.min' => 'Farm size cannot be negative.',
            'physical_address.max' => 'Physical address cannot exceed 500 characters.',
            'regional_registration_number.max' => 'Regional registration number cannot exceed 255 characters.',
        ];
    }
}
