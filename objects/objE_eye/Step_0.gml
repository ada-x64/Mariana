//pause
if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
{
	path_speed = 0;
	image_speed = 0;
	exit;
}
else
{
	path_speed = pspd;
	image_speed = 8/fps;
}


if path_index = noone
{
	path_start(pindex,pspd,pend,pabs);
}
else
{
	pspd   = path_speed;
	ppos   = path_position;
	prot   = path_orientation;
}

#region bullets
bdir = darctan2(y - (global.playarea_y1 + global.playarea_height/2), -x + (global.playarea_x1 + global.playarea_width/2) );
barr[2] = bdir;
//if bdir % 30 == 0 {btimer = 0; barr[8] = 0;}
if y >= global.playarea_y1 + global.playarea_height/3
	barr = enemy_spawn_bullet(barr);
btype		= barr[0];
bspd		= barr[1];
bdir		= barr[2];
bcurve		= barr[3];
bfreq		= barr[4];
blifespan	= barr[5];
bx			= barr[6];
by			= barr[7];
btimer		= barr[8];
btimer2		= barr[9];
#endregion bullets
#region hp
hparr[0] = hp;
hparr[1] = is_hurt;
hparr[2] = hurt_timer;
hparr[3] = hx;
hparr[4] = hy;
hparr = enemy_do_hp(hparr);
hp			= arr[0];
is_hurt		= arr[1];
hurt_timer	= arr[2];
hx			= arr[3];
hy			= arr[4];
#endregion hp