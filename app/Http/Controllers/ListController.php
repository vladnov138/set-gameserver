<?php

namespace App\Http\Controllers;

use App\Models\Game;
use Illuminate\Http\Request;
use App\Exceptions\FieldException;
use App\Exceptions\ApiException;
use App\Models\User;

class ListController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        if (empty($request['accessToken']))
            throw new FieldException();
        $result = User::select('id')->where('api_token', $request['accessToken'])->get();
        if (empty($result[0]) || empty($result[0]['id']))
            throw new ApiException('Wrong accessToken');

        $games = Game::select('id')->get();
        return [
            'success' => true,
            'expection' => null,
            'games' => $games
        ];
    }
}
