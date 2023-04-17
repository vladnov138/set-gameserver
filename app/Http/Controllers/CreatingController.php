<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Exceptions\FieldTokenException;
use Illuminate\Http\Request;
use App\Models\Game;
use App\Models\User;
use App\Models\Card;
use App\Models\Score;

class CreatingController extends Controller
{
    private $cards_limit = 81;
    private $properties_limit = 3;
    private $field_cards_limit = 12;

    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_token($request);
        $this->check_room_title($request);
        
        $id = User::select('id')->where('api_token', $request['accessToken'])->get()[0]['id'];

        $this->check_user_playing_room($id);

        $game = Game::create($data = [
            'name' => $request['roomTitle'],
            'creator_id' => $id,
            'players' => json_encode([
                $id
            ])
        ]);
        User::where('id', $id)->limit(1)->update(['room_id' => $game->id]);
        Score::create(['room_id' => $game->id, 'players_scores' => json_encode([$id => 0])]);
        $this->fill_cards($game->id);
        return [
            "success" => true,
            "exception" => null,
            "gameId" => $game->id
        ];
    }

    private function fill_cards(int $room_id)
    {
        $cards = [];
        for ($color = 1, $id = 1; $color <= $this->properties_limit; $color++)
            for ($shape = 1; $shape <= $this->properties_limit; $shape++)
                for ($fill = 1; $fill <= $this->properties_limit; $fill++)
                    for ($count = 1; $count <= $this->properties_limit; $count++, $id++)
                        $cards[] = [
                            'id' => $id,
                            'color' => $color,
                            'shape' => $shape,
                            'fill' => $fill,
                            'count' => $count
                        ];
        shuffle($cards);
        $field_cards = array_slice($cards, 0, $this->field_cards_limit);
        array_splice($cards, 0, $this->field_cards_limit);

        Card::create([
            'room_id' => $room_id,
            'cards' => json_encode(
                $cards
            ),
            'field_cards' => json_encode(
                $field_cards
            )
        ]);
    }
}
