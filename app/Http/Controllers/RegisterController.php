<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;


class RegisterController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        if (count(User::select('name')->where('name', $request['nickname'])->get()) === 0) {
            return $this->register($request['nickname'], $request['password']);
        } else {
            return ["success" => false,
                "exception" => [
                    "message" => "This nickname is already registered"
                ]];
        }
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
            'nickname' => $user->name,
            'accessToken' => $user->api_token
        ];
    }
}
