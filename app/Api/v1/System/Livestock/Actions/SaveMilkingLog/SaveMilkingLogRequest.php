<?php

namespace App\Api\v1\System\Livestock\Actions\SaveMilkingLog;

use Illuminate\Foundation\Http\FormRequest;

class SaveMilkingLogRequest extends FormRequest
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
            'milkingMethodId' => 'required',
            'milkingSessionId'=>'required',
            'milkingUnitId'=> 'required',
            'farmId' => 'required',
            'livestockId'=> 'required',
            'amount' => 'required',
            'lactometerReading' => 'required',
            'solid' => 'required',
            'solidNonFat' => 'required',
            'acidity'=>'required',
            'protein'=> 'required',
            'colonyFormingUnit'=>'required',
            'correctedLactometerReading'=>'required',
            'dateTime'=>'required'
        ];
    }
}
