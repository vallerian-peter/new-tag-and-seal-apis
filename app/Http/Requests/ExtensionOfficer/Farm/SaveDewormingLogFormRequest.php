<?php

namespace App\Http\Requests\ExtensionOfficer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class SaveDewormingLogFormRequest extends FormRequest
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
            'medicine' => 'required',
            'quantity'=> 'required',
            'quantity_unit_id'=> 'required',
            'administration_route'=> 'required',
            'next_date'=> 'required',
            'officer_id'=> 'required',
            'remarks'=> 'required',
            'date'=> 'nullable'
        ];
    }
}
