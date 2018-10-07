/// @description Insert description here
// You can write your code in this editor
if in_radius
{
	draw_set_color(c_white);
	draw_set_alpha(1);
	part_type_speed(global.pt[PT.in_forcefield],force+sign(force),force+sign(force),1/10,0);
	part_type_direction(global.pt[PT.in_forcefield],objM.dir+60,objM.dir+60,0,0);
	part_particles_create(global.ps_player,objM.x,objM.y,global.pt[PT.in_forcefield],choose(1,0,0));
	part_type_direction(global.pt[PT.in_forcefield],objM.dir-60,objM.dir-60,0,0);
	part_particles_create(global.ps_player,objM.x,objM.y,global.pt[PT.in_forcefield],choose(1,0,0));
}