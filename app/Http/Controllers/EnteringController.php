<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exceptions\FieldTokenException;
use App\Exceptions\ApiException;
use App\Models\User;
use App\Models\Game;
use App\Models\Score;

class EnteringController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_token($request);

        $user_id = User::select('id')->where('api_token', $request['accessToken'])->get();

        $this->check_game_id($request['gameId'] ?? '');
        $result = Game::select('id', 'players')->where('id', $request['gameId'])->get();
        $game_id = $result[0]['id'];

        $this->check_user_playing_room($user_id);

        $players = json_decode($result[0]['players']);
        $players[] = $user_id;
        Game::where('id', $game_id)->limit(1)->update(['players' => json_encode($players)]);
        User::where('id', $user_id)->limit(1)->update(['room_id' => $game_id]);
        $scores = json_decode(Score::select('players_scores')->where('id', $game_id)[0]['scores'], true);
        $scores[$user_id] = 0;
        Score::where('id', $game_id)->limit(1)->update(['players_scores' => json_encode($scores)]);

        return [
            'success' => true,
            'exception' => null,
            'gameId' => $game_id
        ];
    }
}
