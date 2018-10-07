//pause
if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
{
	path_speed = 0;
	image_speed = 0;
	exit;
}
else
{
	if intro_done and !exiting {path_speed = pspd;}
	else if !intro_done {path_speed = intro_pspd;}
	else {path_speed = exit_pspd;}
	image_speed = 8/fps;
	spr_rot += choose(1,-1) * choose(30/fps, 60/fps, 90/fps, 360/fps)
}
#region movement
//clamp position
if y < -16 {y = -16;}
else if y > room_height + 16 {y = room_height + 16;}
if x < -16 {x = -16;}
else if x > room_width + 16 {y = room_width + 16;}

if intro_start
{
	entry_path	= make_curve(x,y,xgoal,ygoal,entry_curve);
	path_start(entry_path,intro_pspd,path_action_stop,true);
	intro_start = false;
}
if path_index = entry_path and path_position >= 0.95
{
	path_start(path_idle,0.25,path_action_restart,false);
	intro_done = true;
}
lifespan_timer += global.tl_time;
if lifespan_timer > lifespan*fps
{
	xgoal = global.playarea_x1+global.playarea_width/2;
	ygoal = -100;
	exit_path = make_curve(x,y,xgoal,ygoal,exit_curve);
	path_start(exit_path,exit_pspd,path_action_stop,true);
	exiting = true;
}
if exiting and y < -sprite_height
	{instance_destroy(id);}
#endregion movement
#region bullets
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
bimmune     = barr[10];
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