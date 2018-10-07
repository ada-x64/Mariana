#region systems
global.ps_player	 = part_system_create_layer(global.player_layer,	 true);
global.ps_enemy		 = part_system_create_layer(global.enemy_layer,		 true);
global.ps_bullet	 = part_system_create_layer(global.bullet_layer,     true);
global.ps_background = part_system_create_layer(global.background_layer, true);
#endregion systems
#region types
enum PT
{
	explosion,
	trail,
	special_ready,
	in_forcefield
}
global.pt_count = 4;
global.pt = array_create(4);
for (var i = 0; i < global.pt_count; i++)
{
	global.pt[i] = part_type_create();
}
#endregion types
#region make types
#region explosion
part_type_alpha1(global.pt[0],1);
part_type_sprite(global.pt[0],part_explode,1,1,0);
part_type_size(global.pt[0],1,16,-0.5,1);
part_type_life(global.pt[0],60/4,60/2);
part_type_speed(global.pt[0],4,10,-1,0);
part_type_direction(global.pt[0],0,360,random_range(-360,360),1);
#endregion explosion
#region trail
part_type_sprite(global.pt[1],part_trail,true,true,false);
part_type_life(global.pt[1],30,30);
part_type_alpha2(global.pt[1],0.25,0.125);
part_type_size(global.pt[1],8,8,-0.25,0);
#endregion
#region special_ready
part_type_sprite(global.pt[2],part_ring,true,true,0);
part_type_size(global.pt[2],1.75,1.75,-1.75/15,0);
part_type_life(global.pt[2],15,15);
part_type_alpha2(global.pt[2],0.5,0);
part_type_orientation(global.pt[2],0,0,10,0,false);
#endregion
#region in forcefield
part_type_alpha2(global.pt[3],0.8,0);
part_type_speed(global.pt[3],1,3,1/60,0);
part_type_sprite(global.pt[3],part_pixel,true,true,false);
part_type_life(global.pt[3],1,30);
part_type_scale(global.pt[3],2,2);
#endregion forcefield
#endregion make types