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

    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_user_fields($request);
        if (count(User::select('name')->where('name', $request['nickname'])->get()) !== 0)
            throw new ApiException($this->register_exception);
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
                'nickname' => $user->name,
                'accessToken' => $user->api_token
            ];
        }
    }
}
