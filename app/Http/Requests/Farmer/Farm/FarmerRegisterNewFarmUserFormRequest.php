<?php

namespace App\Http\Requests\Farmer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class FarmerRegisterNewFarmUserFormRequest extends FormRequest
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
            'farmer_no' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'address' => 'required',
            'role' => 'required',
            'farm_id' => 'required'
        ];
    }
}
