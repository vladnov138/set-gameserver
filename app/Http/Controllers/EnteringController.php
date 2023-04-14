<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exceptions\FieldException;
use App\Exceptions\ApiException;
use App\Models\User;
use App\Models\Game;

class EnteringController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        if (empty($request['accessToken']) || empty($request['gameId']))
            throw new FieldException();
        $result = User::select('id')->where('api_token', $request['accessToken'])->get();
        if (empty($result[0]) || empty($result[0]['id']))
            throw new ApiException('Wrong accessToken');

        $user_id = $result[0]['id'];

        $result = Game::select('id', 'players')->where('id', $request['gameId'])->get();
        if (empty($result[0]) || empty($result[0]['id']))
            throw new ApiException('Wrong game ID');
        $game_id = $result[0]['id'];
        
        if (User::select('is_playing')->where('id', $user_id)->get()[0]['is_playing'])
            throw new ApiException('The user is playing in another room');

        $players = json_decode($result[0]['players']);
        $players[] = $user_id;
        Game::where('id', $game_id)->limit(1)->update(['players' => json_encode($players)]);
        User::where('id', $user_id)->limit(1)->update(['is_playing' => true, 'room_id' => $game_id]);

        return [
            'success' => true,
            'expection' => null,
            'gameId' => $game_id
        ];
    }
}
