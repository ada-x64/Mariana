if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
	{exit;}
	
bosshp = objE_bossTestCenter.hp;
dir = stepcount/1000 * 360 + 36 * peripheralNumber;
#region hp
if !instance_exists(objE_bossTestCenter)
hparr[0] = 0;
else
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
if !instance_exists(objE_bossTestPeripheral) {exit;}

#region bullets
if bsetup
{
	barr = enemy_init_bullets(Btype.burst5,.75,360*peripheralNumber/10,0,0.5,-1,true);
	bsetup = false;
}
barr[Barr.dir] = dir + 180;
if instance_exists(objE_bossTestCenter) barr[Barr.freq] = 1 - (10-bosshp)/100
barr = enemy_spawn_bullet(barr);
#endregion bullets

if instance_exists(objE_bossTestCenter)
	stepcount += 2*global.speed_manip//2-bosshp;
	
var xx = global.playarea_midx;
var yy = global.playarea_midy;
var enter_time = fps;
if enter
{
	var dist = 104
	x = xx + dist * (stepcount/enter_time) * dcos(dir);
	y = yy + dist * (stepcount/enter_time) * -dsin(dir);
	if stepcount > enter_time
	{enter = false;}
}
else
{
	var dist = 104 + (18-bosshp)*sin(pi/3*peripheralNumber+pi*stepcount/500)
	x = xx + dist * dcos(dir);
	y = yy + dist * -dsin(dir);
}