<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthenticateController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        if (empty($request['nickname']) || empty($request['password']))
            return ["success" => false,
            "exception" => [
                "message" => "Nickname and passwords fields are required"
            ]];
        if (count(User::select('name')->where('name', $request['nickname'])->get()) === 1) {
            return $this->authenticate($request['nickname'], $request['password']);
        } else {
            return ["success" => false,
                "exception" => [
                    "message" => "Wrong login or password"
                ]];
        }
    }

    private function authenticate(string $login, string $password) {
        $user_data = User::select('password', 'api_token')->where('name', $login)->get()[0];
        if (password_verify($password, $user_data['password'])) {
            return [
                'nickname' => $login,
                'token' => $user_data['api_token']
            ];
        }
        return ["success" => false,
        "exception" => [
            "message" => "Wrong login or password"
        ]];
    }
}
