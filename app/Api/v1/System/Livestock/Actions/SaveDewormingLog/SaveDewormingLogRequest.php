<?php

namespace App\Api\v1\System\Livestock\Actions\SaveDewormingLog;

use Illuminate\Foundation\Http\FormRequest;

class SaveDewormingLogRequest extends FormRequest
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
            'farmId' => 'required',
            'livestockId' => 'required',
            'medicineId' => 'required',
            'quantity'=> 'required',
            'quantityUnitId'=> 'required',
            'administrationRoute'=> 'required',
            'nextDate'=> 'required',
            'remarks'=> 'required',
            'date'=> 'nullable'
        ];
    }
}
