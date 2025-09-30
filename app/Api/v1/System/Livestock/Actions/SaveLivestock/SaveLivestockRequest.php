<?php

namespace App\Api\v1\System\Livestock\Actions\SaveLivestock;

use Illuminate\Foundation\Http\FormRequest;

class SaveLivestockRequest extends FormRequest
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
            'name' => 'required',
            'nida' => 'required',
            'livestock_type' => 'required',
            'specie' => 'required',
            'breed' => 'required',
            'dob' => 'required',
            'gender' => 'required',
            'mother' => 'nullable',
            'father' => 'nullable',
            'livestock_stage' => 'required',
            'animal_picture' => 'nullable',
            'farm_tag' => 'required',
            'farm_id' => 'required',
            'weight_as_on_registration'=>'required',
            'livestock_obtained_method'=>'required',
            'date_first_entered_to_farm'=>'required',
            'parity_lactacting_number'=>'nullable',
            'date_of_last_calving'=>'nullable',
            'total_milk_produced'=>'nullable',
            'livestock_status'=>'required'
        ];
    }
}
