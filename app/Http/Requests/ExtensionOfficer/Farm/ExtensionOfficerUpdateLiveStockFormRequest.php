<?php

namespace App\Http\Requests\ExtensionOfficer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class ExtensionOfficerUpdateLiveStockFormRequest extends FormRequest
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
            'name' => 'nullable',
            'nida' => 'required',
            'livestock_type' => 'nullable',
            'specie' => 'nullable',
            'breed' => 'nullable',
            'dob' => 'nullable',
            'gender' => 'required',
            'mother' => 'nullable',
            'father' => 'nullable',
            'livestock_stage' => 'nullable',
            'animal_picture' => 'nullable',
            'farm_tag' => 'nullable',
            'farm_id' => 'nullable',
            'officer_id' => 'nullable'
        ];
    }
}
    