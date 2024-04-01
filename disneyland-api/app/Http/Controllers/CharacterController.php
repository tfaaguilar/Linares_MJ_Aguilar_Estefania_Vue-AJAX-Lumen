<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Character;


class CharacterController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function getAll() {
         $characters = Character::all();
         return response()->json($characters);
     }

     public function getOne($id) {
         $character = Character::find($id);
         return response()->json($character);
     }

     public function save(Request $request) {
        $this->validate($request, [
            'name' => 'required',
            'image_url' => 'required',
            'description' => 'required|date',
            'enemy_id' => 'required'
        ]);
        $character = Character::create($request->all());
        return response()->json($character, 201);
    }
    
    
    
    public function update(Request $request, $id) {
        $character = Character::findOrFail($id);
    
        $this->validate($request, [
            'name' => 'required',
            'image_url' => 'required',
            'description' => 'required|date',
            'enemy_id' => 'required'
        ]);
        $character->update($request->all());
        return response()->json($character);
    }
    
    
    public function delete($id) {
        $character = Character::findOrFail($id);
        $character->delete();
        return response()->json(null, 204);
    }
    
    
 

}
