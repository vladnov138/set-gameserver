<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exceptions\FieldTokenException;
use App\Exceptions\ApiException;
use App\Models\User;
use App\Models\Game;
use App\Models\Card;
use App\Models\Score;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\App;

class SetController extends Controller
{
    private $properties = ['color', 'count', 'shape', 'fill'];
    private const PROPERTIES = ['color', 'count', 'shape', 'fill'];
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
        $this->check_game_process($game_id);
        $field_cards = json_decode(
            Card::select('field_cards')->where('room_id', $game_id)->get()[0]['field_cards'],
            true
        );
        $set_cards = $this->find_cards_by_id($field_cards, $request['cards']);

        if (count($set_cards) !== 3)
            throw new ApiException('There are no these cards on the field or invalid cards id');
        $flag_isSet = SetController::is_set($set_cards);
        if ($flag_isSet) {
            $this->update_score($user_id, $game_id);
            Card::where('room_id', $game_id)->limit(1)->update(['field_cards' => json_encode($field_cards)]);
            if (count($field_cards) < 12)
                $field_cards = GetController::get_field_cards($game_id);
            if ($this->is_game_finished($game_id, $field_cards))
                Game::where('id', $game_id)->limit(1)->update(['is_processing' => false]);
        }


        return [
            'success' => true,
            'exception' => null,
            'isSet' => $flag_isSet
        ];
    }

    private function find_cards_by_id(&$field_cards, $cards)
    {
        $set_cards = [];
        for ($i = 0; $i < count($field_cards); $i++)
            if (in_array($field_cards[$i]['id'], [$cards[0], $cards[1], $cards[2]])) {
                $set_cards[] = $field_cards[$i];
                array_splice($field_cards, $i, 1);
                $i--;
            }
        return $set_cards;
    }

    public static function is_set(array $set_cards)
    {
        // $flag_isSet = true;
        foreach (SetController::PROPERTIES as $property)
            if (!($set_cards[0][$property] === $set_cards[1][$property] && $set_cards[1][$property] ===
                $set_cards[2][$property] || $set_cards[0][$property] !== $set_cards[1][$property] &&
                $set_cards[1][$property] !== $set_cards[2][$property] &&
                $set_cards[0][$property] !== $set_cards[2][$property])) {
                return false;
            }
        return true;
    }

    private function update_score(int $user_id, int $game_id)
    {
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

    private function is_game_finished(int $room_id, $field_cards)
    {
        $cards = json_decode(Card::select('cards')->where('room_id', $room_id)->get()[0]['cards']);
        $is_set_exists = false;
        if (count($cards) === 0)
            for ($i = 0; $i < count($field_cards); $i++)
                for ($j = $i + 1; $j < count($field_cards); $j++)
                    for ($k = $j + 1; $k < count($field_cards); $k++) {
                        $is_set_exists = SetController::is_set([$field_cards[$i], $field_cards[$j], $field_cards[$k]]);
                        if ($is_set_exists)
                            return true;
                    }
        return false;
    }
}
