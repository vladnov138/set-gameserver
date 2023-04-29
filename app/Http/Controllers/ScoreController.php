<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Score;
use App\Models\Card;

class ScoreController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_token($request);
        $result = User::select('id', 'room_id')->where('api_token', $request['accessToken'])->get();
        $user_id = $result[0]['id'];
        $this->check_if_user_playing($user_id);

        $room_id = User::select('room_id')->where('id', $user_id)->get()[0]['room_id'];

        
        $players_scores_by_id = json_decode(Score::select('players_scores')->where('room_id', $room_id)
            ->get()[0]['players_scores'], true);
        $scores = [];
        foreach (array_keys($players_scores_by_id) as $id) {
            $name = User::select('name')->where('id', $id)->get()[0]['name'];
            $score['name'] = $name;
            $score['score'] = $players_scores_by_id[$id];
            $scores[] = $score;
        }

        return ['success' => true,
            'exception' => null,
            'users' => $scores];
    }
}
