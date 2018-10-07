alarm[0] = fps*4;
timer = 0;
x = global.playarea_midx//+choose(1,-1)*random(100);
y = global.playarea_midy//-100;
xspd = 0;
yspd = 0;
image = 0;
surf = surface_create(64,64);
is_hurt = false;
forcefield = instance_create_layer(x,y,global.enemy_layer,objE_forcefield);
with forcefield
{
	force = 1;
	radius = 128;
	lifespan = fps*4;
}