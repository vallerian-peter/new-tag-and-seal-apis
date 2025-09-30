<?php

namespace App\Api\v1\System\Livestock\Actions\SaveInseminationLog;

use Illuminate\Foundation\Http\FormRequest;

class SaveInseminationLogRequest extends FormRequest
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
            'lastHeatDate' => 'required',
            'currentHeatTypeId' => 'required',
            'inseminationDate' => 'required',
            'inseminationServiceId' => 'required',
            'inseminationSemenStrawTypeId'=>'required',
            'bullCode' => 'required',
            'bullBreed' => 'required',
            'semenProductionDate' => 'required',
            'productionCountry' => 'required',
            'semenBatchNumber' => 'required',
            'internationalId' => 'required',
            'aiCode' => 'required',
            'manufacturerName' => 'required',
            'semenSupplier' => 'required',
        ];
    }
}
