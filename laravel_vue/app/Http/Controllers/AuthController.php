<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;

class AuthController extends Controller
{
    public function index()
    {
        // $users = DB::table('users')->select('id', 'name')->get();

        $users = User::select('id', 'name')->get();

        return response()->json($users);
    }

    public function show($id)
    {
        // $user = DB::table('users')->where('id', $id)->first();

        $user = User::where('id', $id)->first();

        return response()->json($user);
    }

    public function store(Request $request)
    {
        // $validatedData = $request->validate([
        //     'name' => 'required|string|max:255',
        //     'email' => 'required|string|email|max:255|unique:users',
        //     'password' => 'required|string|min:8',
        // ]);

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                "status" => false,
                "message" => $validator->errors(),
            ], 403);
        }

        // Cara 1
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->save();

        // Cara 2
        // $user = User::create([
        //     "name" => $request->name,
        //     "email" => $request->email,
        //     "password" => bcrypt($request->password),
        // ]);

        return response()->json([
            "status" => true,
            "message" => 'Data User berhasil disimpan',
            "data" => $user
        ]);
    }

    public function destroy($id)
    {
        $user = User::find($id);

        $user->delete();

        return response()->json([
            "status" => true,
            "message" => 'Data User berhasil dihapus',
        ]);
    }

    public function update($id, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
        ]);

        $user = User::find($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->save();

        return response()->json([
            "status" => true,
            "message" => 'Data User berhasil diubah',
            "data" => $user
        ]);
    }
}
