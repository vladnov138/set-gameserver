<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Exceptions\FieldException;
use Illuminate\Http\Request;
use App\Models\Game;
use App\Models\User;

class CreatingController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        if (empty($request['accessToken']) || empty($request['roomTitle']))
            throw new FieldException();
        $result = User::select('id')->where('api_token', $request['accessToken'])->get();
        if (empty($result[0]) || empty($result[0]['id']))
            throw new ApiException('Wrong accessToken');

        $id = $result[0]['id'];
        
        if (User::select('is_playing')->where('id', $id)->get()[0]['is_playing'])
            throw new ApiException('The user is playing in another room');

        $game = Game::create($data = [
            'name' => $request['roomTitle'],
            'creator_id' => $id,
            'players' => json_encode([
                $id
            ])
        ]);
        User::where('id', $id)->limit(1)->update(['is_playing' => true, 'room_id' => $game->id]);
        return [
            "success" => true,
            "exception" => null,
            "gameId" => $game->id
        ];
    }
}
