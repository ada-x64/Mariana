///@function enemy_do_hp(hparr)
///@param hparr

arr = argument0;

hp			= arr[0];
is_hurt		= arr[1];
hurt_timer	= arr[2];
hx			= arr[3];
hy			= arr[4];

if (place_meeting(x,y,objM) && !objM.hp_is_invincible)
    {with (objM) {ishurt = true; hit_amount = 0.25;}}
if (is_hurt)
{
	hx = random_range(-2,2);
	hy = random_range(-2,2);
    hurt_timer -= global.speed_manip;
    if (hurt_timer <= 0)
        {hurt_timer = 0; is_hurt = false;}
	score += 11;
}
else
{
	hx = 0;
	hy = 0;
}
if (hp <= 0)
{
	fx_explode(sprite_get_width(mask_index)*3/2,sprite_get_height(mask_index)*3/2, global.enemy_layer);
	global.enemies_killed ++;
	score += 103;
	instance_destroy();
}

arr[0] = hp;
arr[1] = is_hurt;
arr[2] = hurt_timer;
arr[3] = hx;
arr[4] = hy;

return arr;