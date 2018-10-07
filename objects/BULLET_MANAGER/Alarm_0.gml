/// @description Insert description here
// You can write your code in this editor
ds_list_clear(global.bullet_list);
ds_list_clear(global.bullet_list_M);
ds_list_clear(global.bullet_list_i);
global.surf_bullets = surface_create(room_width,room_height);
global.bullet_layer = layer_create(50,"bullet layer");
layer = global.bullet_layer;