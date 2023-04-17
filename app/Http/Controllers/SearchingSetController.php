<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Card;

class SearchingSetController extends Controller
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
        $field_cards = json_decode(Card::select('field_cards')->where('room_id', $room_id)->get()[0]["field_cards"], true);
        $set_cards = $this->find_set($field_cards);

        return [
            'success' => true,
            'exception' => null,
            'message' => 'Cheater!',
            'setCards' => $set_cards
        ];
    }

    private function find_set(array $field_cards) {
        for ($i = 0; $i < count($field_cards); $i++) {
            for ($j = $i + 1; $j < count($field_cards); $j++) {
                for ($k = $j + 1; $k < count($field_cards); $k++) {
                    $is_set_exists = SetController::is_set([$field_cards[$i], $field_cards[$j], $field_cards[$k]]);
                    if ($is_set_exists) {
                        return [$field_cards[$i]['id'], $field_cards[$j]['id'], $field_cards[$k]['id']];
                    }
                }
            }
        }
        return [];
    }
}
