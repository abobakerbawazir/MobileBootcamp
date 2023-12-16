<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\AccounttypeController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\CurrencyController;
use App\Http\Controllers\TransactiontController;
use App\Http\Controllers\TypetransactiontController;
use App\Http\Controllers\UserController;
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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::get('userss', [UserController::class, "index"]);

Route::apiResources([
    //'indexAuthor'=>[AuthorController::class,'indexAuthor'],
    'users' => UserController::class,
    'accounts' => AccountController::class,
    'accounttypes' => AccounttypeController::class,
    'branches' => BranchController::class,
    'currencies' => CurrencyController::class,
    'transactiont' => TransactiontController::class,
    'typetransactiont' => TypetransactiontController::class,
    
]);