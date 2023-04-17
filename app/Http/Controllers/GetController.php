<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Card;

class GetController extends Controller
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
        $this->check_game_process($room_id);
        $field_cards = GetController::get_field_cards($room_id);
        
        return [
            'success' => true,
            'exception' => null,
            'fieldCards' => $field_cards
        ];
    }

    public static function get_field_cards($room_id) {
        $field_cards = json_decode(
            Card::select('field_cards')->where('room_id', $room_id)->get()[0]["field_cards"],
            true
            );
        if (count($field_cards) > 21)
            throw new ApiException('Set exists in the field');
        $cards = json_decode(Card::select('cards')->where('room_id', $room_id)->get()[0]['cards'], true);
        if (count($cards) === 0)
            throw new ApiException('There are no cards');
        $field_cards = array_merge($field_cards, array_slice($cards, 0, Controller::GET_CARDS_LIMIT));
        array_splice($cards, 0, Controller::GET_CARDS_LIMIT);
        Card::where('room_id', $room_id)->limit(1)->update([
            'cards' => json_encode(
                $cards
            ),
            'field_cards' => json_encode(
                $field_cards
                )
            ]);
        return $field_cards;
    }
    
}
