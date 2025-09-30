<?php

namespace App\Api\v1\System\Farmer\Actions\Register;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class FarmerRegisterRequest extends FormRequest
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
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'first_name' => 'required',
            'middle_name' => 'nullable',
            'surname' => 'required',
            'phone_1' => 'required',
            'phone_2' => 'nullable',
            'email' => 'required',
            'address' => 'required',
            'farmer_organization_membership' => 'nullable',
            'farmer_type' => 'required',
            'dob' => 'required',
            'gender' => 'required',
            'id_card_type' => 'required',
            'id_number' => 'required',
            'education_level' => 'required',
//            'country' => 'nullable',
            'region' => 'required',
            'district' => 'required',
            'passport_picture' => 'nullable'
        ];
    }
}
