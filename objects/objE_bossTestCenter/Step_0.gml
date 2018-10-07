if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
	{exit;}
#region bullets
//barr[2] = 360*timer/1000;
barr[Barr.curve] = 90 - 7.5*(10-hp)
barr[Barr.dir]  += 1+(10-hp)/2;
barr = enemy_spawn_bullet(barr);
//barr5 = enemy_spawn_bullet(barr5);
barr4[Barr.freq] = 3 - ((10-hp)/10)
if hp <= 8 and hp > 4 {barr4 = enemy_spawn_bullet(barr4);}
if hp <= 6
{
	barr_laser0 = enemy_spawn_bullet(barr_laser0);
	barr_laser1 = enemy_spawn_bullet(barr_laser1);
	barr_laser2 = enemy_spawn_bullet(barr_laser2);
	barr_laser3 = enemy_spawn_bullet(barr_laser3);
}
if hp <= 4
{
	barr_laser0[Barr.freq] = hp+1;
	barr_laser1[Barr.freq] = hp+1;
	barr_laser2[Barr.freq] = hp+1;
	barr_laser3[Barr.freq] = hp+1;
	barr_laser0[Barr.dir]  = random_range(-2.5,2.5)+point_direction(x,y,objM.x,objM.y);
	barr_laser1[Barr.dir]  = random_range(-2.5,2.5)+90+point_direction(x,y,objM.x,objM.y);
	barr_laser2[Barr.dir]  = random_range(-2.5,2.5)+180+point_direction(x,y,objM.x,objM.y);
	barr_laser3[Barr.dir]  = random_range(-2.5,2.5)+270+point_direction(x,y,objM.x,objM.y);
}
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

if hp <= 0
{
	hp = 0;
	instance_destroy(objE_bossTestPeripheral);
	instance_create_layer(x,y,layer,objE_bossTestDead);
	exit;
}
#endregion hp

timer += global.speed_manip;

if (hurt_timer >= fps/4 - global.speed_manip) {spawn_more = true;}
if (spawn_more)
{
	forcefield.force = 3;
	spawn_more = false;
	instance_destroy(objE_bossTestPeripheral);
	for (var i = 0; i < 10; i ++)
	{
		var e = instance_create_layer(x,y,global.enemy_layer,objE_bossTestPeripheral);
		e.peripheralNumber = i;
	}
}
else
{
	forcefield.force = 1;
}