<?php

namespace App\Http\Requests\Farmer\Farm;

use Illuminate\Foundation\Http\FormRequest;

class FarmerLogMilkingFormRequest extends FormRequest
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
            'milking_method_id' => 'required',
            'milking_session_id'=>'required',
            'milking_unit_id'=> 'required',
            'farm_id' => 'required',
            'livestock_id'=> 'required',
            'amount' => 'required',
            'lactometer_reading' => 'required',
            'solid' => 'required',
            'solid_non_fat' => 'required',
            'acidity'=>'required',
            'protein'=> 'required',
            'colony_forming_unit'=>'required',
            'corrected_lactometer_reading'=>'required',
            'dateTime'=>'required'           
        ];
    }
}
