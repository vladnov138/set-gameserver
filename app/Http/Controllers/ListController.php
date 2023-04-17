<?php

namespace App\Http\Controllers;

use App\Models\Game;
use Illuminate\Http\Request;
use App\Exceptions\FieldException;
use App\Exceptions\ApiException;
use App\Models\User;

class ListController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $this->check_token($request);

        $games = Game::select('id', 'name')->get();
        return [
            'success' => true,
            'exception' => null,
            'games' => $games
        ];
    }
}
