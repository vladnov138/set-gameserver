<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Exceptions\ApiException;
use App\Exceptions\FieldUserException;

class RegisterController extends Controller
{
    private $register_exception = 'This nickname is already registered';
    private $auth_exception = 'Wrong login or password';
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_user_fields($request);
        if (count(User::select('name')->where('name', $request['nickname'])->get()) !== 0) {
            $user_data = User::select('password', 'api_token')->where('name', $request['nickname'])->get()[0];
            if (!password_verify($request['password'], $user_data['password']))
                throw new ApiException($this->auth_exception);
            return [
                'success' => true,
                'exception' => null,
                'nickname' => $request['login'],
                'accessToken' => $user_data['api_token']
            ];
        }
        else {
            $password = password_hash($request['password'], PASSWORD_BCRYPT);

            $user_data = [
                'name' => $request['nickname'],
                'password' => $password,
                'api_token' => Str::random(60)
            ];

            $user = User::create($user_data);
            return [
                'success' => true,
                'exception' => null,
                'nickname' => $user->name,
                'accessToken' => $user->api_token
            ];
        }
    }
}
