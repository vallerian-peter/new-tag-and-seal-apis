<?php

namespace App\Http\Requests\ExtensionOfficer\Farmer;

use Illuminate\Foundation\Http\FormRequest;

class ExtensionOfficerGetFarmerFormRequest extends FormRequest
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
            'token' => 'nullable',
            'farmerId'=>'required', 
            'officerId'=>'required'
        ];
    }
}
