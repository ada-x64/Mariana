///make lists

global.bullet_list = ds_list_create();
global.bullet_list_M = ds_list_create();
global.bullet_list_i = ds_list_create();

//if instance_number(BULLET_MANAGER) > 1 {instance_destroy();}

global.surf_bullets = surface_create(room_width,room_height);
global.bullet_layer = layer_create(50,"bullet layer");
layer = global.bullet_layer;