///@function fx_explode(ww,hh,layer)
///@param width
///@param height
///@param layer

play_sfx(sfx_explosion,0,1,1);
var ww	  = argument0;
var hh	  = argument1;
var Layer = argument2;

part_type_size(global.pt[PT.explosion],1,sprite_get_width(sprite_index),-0.5,1);
part_type_direction(global.pt[PT.explosion],0,360,random_range(-360,360),1);

var ps;
switch (Layer)
{
	case (global.player_layer):
		{ps = global.ps_player; break;}
	case (global.enemy_layer):
		{ps = global.ps_enemy; break;}
	case (global.bullet_layer):
		{ps = global.ps_bullet; break;}
	case (global.background_layer):
		{ps = global.ps_background; break;}
	default:
		{ps = global.ps_player; break;}
}
pe = part_emitter_create(ps);
part_emitter_region(ps,pe,x-ww/2,x+ww/2,y-hh/2,y+hh/2,ps_shape_ellipse,ps_distr_gaussian)
part_emitter_burst(ps,pe,global.pt[0],random_range(50,75));
part_emitter_destroy(ps,pe);