<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Exceptions\ApiException;
use App\Exceptions\FieldException;


class RegisterController extends Controller
{
    private $register_exception = 'This nickname is already registered';
    
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        if (empty($request['nickname']) || empty($request['password']))
            throw new FieldException();
        if (count(User::select('name')->where('name', $request['nickname'])->get()) === 0)
            return $this->register($request['nickname'], $request['password']);
        else
            throw new ApiException($this->register_exception);
    }

    private function register(string $login, string $password) {
        $password = password_hash($password, PASSWORD_BCRYPT);

        $user_data = [
            'name' => $login,
            'password' => $password,
            'api_token' => Str::random(60)
        ];

        $user = User::create($user_data);
        return [
            'success' => true,
            'nickname' => $user->name,
            'accessToken' => $user->api_token
        ];
    }
}
