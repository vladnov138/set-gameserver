<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Game;
use App\Models\Card;

class LeaveController extends Controller
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
        $room_id = $result[0]['room_id'];
        $this->check_game_id($room_id);

        User::where('id', $user_id)->limit(1)->update(['room_id' => null]);

        if (Game::select('creator_id')->where('id', $room_id)->get()[0]['creator_id'] === $user_id) {
            Game::where('id', $room_id)->limit(1)->delete();
            Card::where('room_id', $room_id)->limit(1)->delete();
        }
        return [
            'success' => true,
            'exception' => null
        ];
    }
}
