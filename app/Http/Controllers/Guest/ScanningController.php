<?php

namespace App\Http\Controllers\Guest;

use App\Http\Actions\Guest\ScanTagFormAction;
use App\Http\Controllers\Controller;
use App\Http\Requests\Guest\ScanTagFormRequest;
use Illuminate\Http\Request;

class ScanningController extends Controller
{
    public function scanTag(ScanTagFormRequest $request, ScanTagFormAction $scanTagFormAction)
    {
        $scanTag = $scanTagFormAction->handle($request);
        return response()->json([
            'status' => $scanTag['status'],
            'code' => $scanTag['code'],
            'message' => $scanTag['message'],
            'data' => $scanTag['data']
        ]);
    }
}
