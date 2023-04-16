<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Exceptions\FieldUserException;
use App\Exceptions\ApiException;

class AuthenticateController extends Controller
{
    private $auth_exception = 'Wrong login or password';

    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_user_fields($request);
        if (count(User::select('name')->where('name', $request['nickname'])->get()) === 1)
            throw new ApiException($this->auth_exception);
        else {
            $user_data = User::select('password', 'api_token')->where('name', $request['nickname'])->get()[0];
            if (!password_verify($request['password'], $user_data['password']))
                throw new ApiException($this->auth_exception);
            return [
                'success' => true,
                'nickname' => $request['login'],
                'token' => $user_data['api_token']
            ];
        }
    }
}
