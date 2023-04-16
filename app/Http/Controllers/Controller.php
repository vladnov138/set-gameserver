<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use App\Exceptions\FieldUserException;
use App\Exceptions\FieldTokenException;
use App\Exceptions\ApiException;
use App\Models\User;
use App\Models\Game;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    private const WRONG_TOKEN = 'Wrong accessToken';
    private const USER_FIELDS_REQUIRED = 'Nickname and password fields are required';
    private const WRONG_GAME_ID = 'Wrong game ID';
    private const ANOTHER_ROOM = 'The user is playing in another room';
    private const USER_NOT_PLAYING = 'The user isn`t playing';
    private const WRONG_COUNTS_CARDS = '3 cards required';
    private const CARDS_REQUIRED = 'cards field required';
    private const TOKEN_REQUIRED = 'accessToken field required';
    private const TITLE_REQUIRED = 'roomTitle field required';

    public function check_room_title(Request $request) {
        if (empty($request['roomTitle']))
            throw new ApiException(Controller::TITLE_REQUIRED);
    } 

    public function check_counts_set_cards(Request $request) {
        if (empty($request['cards']))
            throw new ApiException(Controller::CARDS_REQUIRED);
        if (count($request['cards']) !== 3) 
            throw new ApiException(Controller::WRONG_COUNTS_CARDS);
    }

    public function check_game_id(int $id) {
        $result = Game::select('id', 'players')->where('id', $id)->get();
        if (empty($result[0]) || empty($result[0]['id']))
            throw new ApiException(Controller::WRONG_GAME_ID);
    }

    public function check_user_playing_room(int $id) {
        if (!is_null(User::select('room_id')->where('id', $id)->get()[0]['room_id']))
            throw new ApiException(Controller::ANOTHER_ROOM);
    }

    public function check_if_user_playing(int $id) {
        if (is_null(User::select('room_id')->where('id', $id)->get()[0]['room_id']))
            throw new ApiException(Controller::USER_NOT_PLAYING);
    }

    public function check_token(Request $request)
    {
        if (empty($request['accessToken']))
            throw new ApiException(Controller::TOKEN_REQUIRED);
        $result = User::select('id')->where('api_token', $request['accessToken'])->get();
        if (empty($result[0]) || empty($result[0]['id']))
            throw new ApiException(Controller::WRONG_TOKEN);
    }

    public function check_user_fields(Request $request)
    {
        if (empty($request['nickname']) || empty($request['password']))
            throw new ApiException(Controller::USER_FIELDS_REQUIRED);
    }
}
