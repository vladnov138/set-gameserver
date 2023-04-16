<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exceptions\FieldTokenException;
use App\Exceptions\ApiException;
use App\Models\User;
use App\Models\Game;
use App\Models\Card;
use App\Models\Score;

class SetController extends Controller
{
    private $properties = ['color', 'count', 'shape', 'fill'];
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {

        $this->check_token($request);
        $this->check_counts_set_cards($request);
        $result = User::select('id', 'room_id')->where('api_token', $request['accessToken'])->get();
        $user_id = $result[0]['id'];
        $this->check_if_user_playing($user_id);

        $game_id = User::select('room_id')->where('id', $user_id)->get()[0]['room_id'];
        $field_cards = json_decode(
            Card::select('field_cards')->where('room_id', $game_id)->get()[0]['field_cards'],
            true
        )[0];
        $set_cards = [];
        foreach ($field_cards as $card)
            if (
                $card['id'] === $request['cards'][0] || $card['id'] === $request['cards'][1] ||
                $card['id'] === $request['cards'][2]
            )
                $set_cards[] = $card;
        $flag_isSet = true;
        foreach ($this->properties as $property)
            if (!($set_cards[0][$property] === $set_cards[1][$property] && $set_cards[1][$property] ==
                $set_cards[2][$property] || $set_cards[0][$property] !== $set_cards[1][$property] &&
                $set_cards[1][$property] !== $set_cards[2][$property] &&
                $set_cards[0][$property] !== $set_cards[2][$property])) {
                $flag_isSet = false;
                break;
            }
        if ($flag_isSet) {
            if (is_null(Score::select('players_scores')->where('room_id', $game_id)->get()[0]['players_scores'])) {
                Score::where('room_id', $game_id)->limit(1)->update(['players_scores' => json_encode([
                    $user_id => 1
                ])]);
            } else {
                $players_scores = json_decode(Score::select('players_scores')->where('room_id', $game_id)->get()[0]['players_scores'], true);
                if (in_array($user_id, array_keys($players_scores)))
                    $players_scores[$user_id]++;
                else
                    $players_scores[$user_id] = 1;
                Score::where('room_id', $game_id)->limit(1)->update(['players_scores' =>
                    json_encode($players_scores)]);
            }
        }
        return [
            'success' => true,
            'expection' => null,
            'isSet' => $flag_isSet
        ];
    }
}
