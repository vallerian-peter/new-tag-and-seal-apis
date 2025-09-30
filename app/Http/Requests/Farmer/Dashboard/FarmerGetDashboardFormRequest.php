<?php

namespace App\Http\Requests\Farmer\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class FarmerGetDashboardFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return false;
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
            'farm_id' => 'required'
        ];
    }
}
