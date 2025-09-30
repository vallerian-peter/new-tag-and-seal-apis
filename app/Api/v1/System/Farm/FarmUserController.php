<?php
namespace App\Api\v1\System\Farm;

use App\Http\Controllers\Controller;
use App\Api\v1\Core\Auth\Actions\Login\LoginFormRequest;
use App\Api\v1\System\Farm\Actions\Login\FarmUserLoginAction;

class FarmUserController extends Controller {
    public function login(LoginFormRequest $request) {
        return response()->json(FarmUserLoginAction::handle($request));
    }
}


