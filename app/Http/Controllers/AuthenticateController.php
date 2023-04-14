<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Exceptions\FieldException;
use App\Exceptions\ApiException;

class AuthenticateController extends Controller
{
    private $auth_exception = 'Wrong login or password';

    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        if (empty($request['nickname']) || empty($request['password']))
            throw new FieldException();
        if (count(User::select('name')->where('name', $request['nickname'])->get()) === 1)
            throw new ApiException($this->auth_exception);
        else
            return $this->authenticate($request['nickname'], $request['password']);
    }

    private function authenticate(string $login, string $password)
    {
        $user_data = User::select('password', 'api_token')->where('name', $login)->get()[0];
        if (!password_verify($password, $user_data['password']))
            throw new ApiException($this->auth_exception);
        return [
            'success' => true,
            'nickname' => $login,
            'token' => $user_data['api_token']
        ];
    }
}
