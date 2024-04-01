<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/


//matches localhost:8888/lumen/public/
$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/characters', 'CharacterController@getAll');
$router->get('/characters/{id}', 'CharacterController@getOne');
$router->post('/characters/add', 'CharacterController@save');
$router->post('/characters/edit/{id}', 'CharacterController@update');
$router->delete('/characters/delete/{id}', 'CharacterController@delete');













