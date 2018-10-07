/// @description Insert description here
// You can write your code in this editor
if !layer_exists(global.terminal_layer)
	global.terminal_layer = layer_create(-100,"terminal layer");
if !layer_exists( global.player_layer)
	global.player_layer = layer_create(0,"player layer");
if !layer_exists(global.enemy_layer)
	global.enemy_layer = layer_create(10,"enemy layer");
if !layer_exists(global.bullet_layer)
	global.bullet_layer = layer_create(20,"bullet layer");
if !layer_exists (global.background_layer)
	global.background_layer = layer_create(90, "background layer");
