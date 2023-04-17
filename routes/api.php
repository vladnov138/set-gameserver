<?php

use App\Http\Controllers\RegisterController;
use App\Http\Controllers\AuthenticateController;
use App\Http\Controllers\ListController;
use App\Http\Controllers\EnteringController;
use App\Http\Controllers\CreatingController;
use App\Http\Controllers\FieldController;
use App\Http\Controllers\LeaveController;
use App\Http\Controllers\SetAvailableController;
use App\Http\Controllers\SetController;
use App\Http\Controllers\GetController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/user/register', RegisterController::class);
Route::post('/user/auth', AuthenticateController::class);

Route::post('/set/room/create', CreatingController::class);
Route::post('/set/room/list', ListController::class);
Route::post('/set/room/enter', EnteringController::class);

Route::post('set/room/leave', LeaveController::class);

Route::post('/set/field', FieldController::class);
Route::post('/set/pick', SetController::class);
Route::post('/set/get', GetController::class);

Route::post('set/setavailable', SetAvailableController::class);

Route::post('set/test/find_set', SearchingSetController::class);