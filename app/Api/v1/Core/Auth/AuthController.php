<?php
namespace App\Api\v1\Core\Auth;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use App\Api\v1\Core\Auth\Actions\Login\LoginFormRequest;
use App\Http\Controllers\Controller;

class AuthController extends Controller {
    public function login(LoginFormRequest $request) {
        return response()->json(LoginAction::handle($request, ''));
    }
}
