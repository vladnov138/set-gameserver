<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exceptions\FieldException;
use App\Models\Card;
use App\Models\User;
use App\Models\Game;
use App\Exceptions\ApiException;

class FieldController extends Controller
{

    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_token($request);
        $result = User::select('id', 'room_id')->where('api_token', $request['accessToken'])->get();
        $id = $result[0]['id'];
        $this->check_if_user_playing($id);
        $room_id = $result[0]['room_id'];

        $field_cards = Card::select('field_cards')->where('room_id', $room_id)->get();
        return [
            'success' => true,
            'expection' => null,
            'fieldCards' => json_decode($field_cards[0]["field_cards"])[0]
        ];
    }
}
