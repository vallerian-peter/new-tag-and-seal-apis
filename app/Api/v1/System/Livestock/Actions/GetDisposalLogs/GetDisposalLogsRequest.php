<?php

namespace App\Api\v1\System\Livestock\Actions\GetDisposalLogs;

use Illuminate\Foundation\Http\FormRequest;

class GetDisposalLogsRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'farmId' => 'required|integer',
        ];
    }
}

