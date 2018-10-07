timer = 0;
barr = enemy_init_bullets(Btype.radial,1,0,0,1/3,-1,false);
//barr5 = enemy_init_bullets(Btype.spiral,1,90,0,0,-1,false);
//barr2 = enemy_init_bullets(Btype.rings,1,0,0,1,0,true);
barr_laser0 = enemy_init_bullets(Btype.laser,0,0*90,8,4,2,false);
barr_laser1 = enemy_init_bullets(Btype.laser,0,1*90,8,4,2,false);
barr_laser2 = enemy_init_bullets(Btype.laser,0,2*90,8,4,2,false);
barr_laser3 = enemy_init_bullets(Btype.laser,0,3*90,8,4,2,false);
spawn_lasers = true;
barr4 = enemy_init_bullets(Btype.aburst9,2,0,0,0.5,-1,true);
enemy_init_hp(10);
surface = surface_create(258,258);

ctimer = 0;
spawn_more = false;
spr_image = 0;
is_boss = true;

forcefield = instance_create_layer(x,y,global.enemy_layer,objE_forcefield);
with forcefield
{
	lifespan = -1;
	force = 1;
	radius = 128;
}