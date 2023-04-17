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
        $this->check_game_process($game_id);
        $field_cards = json_decode(
            Card::select('field_cards')->where('room_id', $game_id)->get()[0]['field_cards'],
            true
        );
        $set_cards = $this->find_cards_by_id($field_cards, $request['cards']);
        if (count($set_cards) !== 3)
            throw new ApiException('There are no these cards on the field or invalid cards id');
        $flag_isSet = $this->is_set($set_cards);
        if ($flag_isSet) {
            $this->update_score($user_id, $game_id);
            $field_cards = array_diff($field_cards, $set_cards);
            Card::where('room_id', $game_id)->limit(1)->update(['field_cards' => $field_cards]);
            if (count($field_cards) < 12)
                $field_cards = GetController::get_field_cards($game_id);
            if (!$this->is_game_finished($game_id, $field_cards))
                Game::where('id', $game_id)->limit(1)->update(['is_processing' => false]);
        }
        return [
            'success' => true,
            'exception' => null,
            'isSet' => $flag_isSet
        ];
    }

    private function find_cards_by_id($field_cards, $cards)
    {
        foreach ($field_cards as $card)
            if (
                $card['id'] === $cards[0] || $card['id'] === $cards[1] ||
                $card['id'] === $cards[2]
            )
                $set_cards[] = $card;
        return $set_cards;
    }

    private function is_set(array $set_cards)
    {
        $flag_isSet = true;
        foreach ($this->properties as $property)
            if (!($set_cards[0][$property] === $set_cards[1][$property] && $set_cards[1][$property] ==
                $set_cards[2][$property] || $set_cards[0][$property] !== $set_cards[1][$property] &&
                $set_cards[1][$property] !== $set_cards[2][$property] &&
                $set_cards[0][$property] !== $set_cards[2][$property])) {
                $flag_isSet = false;
                break;
            }
        return $flag_isSet;
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

    private function is_game_finished(int $room_id, array $field_cards)
    {
        $cards = json_decode(Card::select('cards')->where('room_id', $room_id)->get()[0]['cards'], true);
        $is_set_exists = false;
        if (count($cards) === 0) {
            for ($i = 0; $i < count($field_cards) - 2; $i++) {
                $is_set_exists = $this->is_set([$field_cards[$i], $field_cards[$i + 1], $field_cards[$i + 2]]);
                if ($is_set_exists)
                    break;
            }
        }
        return $is_set_exists;
    }
}
