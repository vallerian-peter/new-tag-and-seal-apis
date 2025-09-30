<?php

namespace App\Http\Requests\ExtensionOfficer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class SaveWeightLogFormRequest extends FormRequest
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
            'weight' => 'required',
            'date'=> 'nullable',
        ];
    }
}
