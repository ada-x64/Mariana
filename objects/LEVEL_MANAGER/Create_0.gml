///name the levels thru enum, init globals
if instance_number(object_index) > 1 {instance_destroy(self);}
ENUM_LEVEL();
ENUM_ETYPE();
ENUM_BTYPE();
//ENUM_BTYPE_IMMUNE();
ENUM_GRIDTYPE();

global.speed_manip = 1;
global.level = Level.boot;
global.level_pal = Pal.purple_blue;
global.T = 80;
global.bps = 1;
if !layer_exists(global.enemy_layer)
	global.enemy_layer = layer_create(-60,"enemy layer");
//global.surf_enemies = noone;