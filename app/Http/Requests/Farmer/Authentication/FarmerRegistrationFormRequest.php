<?php

namespace App\Http\Requests\Farmer\Authentication;

use Illuminate\Foundation\Http\FormRequest;

class FarmerRegistrationFormRequest extends FormRequest
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
            'first_name' => 'required',
            'middle_name' => 'nullable',
            'surname' => 'required',
            'phone_1' => 'required',
            'phone_2' => 'required',
            'email' => 'required',
            'address' => 'required',
            'farmer_organization_membership' => 'required',
            'farmer_type' => 'required',
            'dob' => 'required',
            'gender' => 'required',
            'id_card_type' => 'required',
            'id_number' => 'required',
            'education_level' => 'required',
            'country' => 'nullable',
            'region' => 'required',
            'district' => 'required',
            // 'passport_picture' => 'required'
        ];
    }
}
