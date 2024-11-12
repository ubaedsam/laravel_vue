<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// All User (Read / Tampilkan)
Route::get('/users', [AuthController::class, 'index']);
// Register User (Create / Tambah)
Route::post('/users/register', [AuthController::class, 'store']);
// Show User (Detail)
Route::get('/users/{id}', [AuthController::class, 'show']);
// Delete User (Delete / Hapus)
Route::delete('/users/delete/{id}', [AuthController::class, 'destroy']);
// Update User (Update / Ubah)
Route::put('/users/update/{id}', [AuthController::class, 'update']);


// Upload Photo User (Update / Ubah)
Route::post('/users/photo/{id}', [UserController::class, 'upload']);
