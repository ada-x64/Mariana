//pause
if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
{exit;}
#region not dead
#region mp
#region vars
var catch_min		= (2/3) / fps;
var special_min		= 1;
var mp_regen		= 0.35 / fps;
var obj_catch		= noone;
var speed_manip		= global.speed_manip;
#region buttons
var cond = abs(gamepad_axis_value(0,gp_axisrh)) > gamepad_get_axis_deadzone(0) or abs(gamepad_axis_value(0,gp_axisrv) > gamepad_get_axis_deadzone(0));
var b_mp    = C.faceDown or cond;
var b_mpP	= C.faceDownP;
var b_mpR	= C.faceDownR;
var b_spec  = C.faceRight or C.bumpRight;
var b_specP = C.faceRightP or C.bumpRightP;
var b_specR = C.faceRightR or C.bumpRightR;
#endregion buttons
#endregion vars
if !is_dead
{
#region functions
#region penalty
if (mp_penalty)
{
    mp_special_timer = 0;
	mp += (mp_regen / 2)*speed_manip;
    if (mp>=0.333)
		{mp_penalty = false;}
    if (b_mpP)
		{cam_shake_surface(self,0.5,3,camtype.linear);}
	gamepad_set_vibration(0,1-mp,1-mp)
}
else {gamepad_set_vibration(0,0,0);}
#endregion penalty
#region specials
switch (mp_special)
{
	case (Special.burst):
	{
		if mp_burst
		{
		    mp -= special_min;
		    instance_create_layer(x,y,global.bullet_layer,objM_burst);
		    mp_burst = false;
		    mp_specials_left --;
		}
		break;
	}
	case (Special.slowdown):
	{
		var time = 12*fps*(global.T*global.bps/60);
		if mp_slowdown
		{
		    mp -= special_min;
			mp_slowdown = false;
			mp_special_timer = time;
		    mp_specials_left --;
		}
		if mp_special_timer > 0
		{
			speed_manip = 1;
			mp_special_timer -= (global.bps)*(global.T/60) + (delta_time) / 1000000;
			global.speed_manip = 0.25 + 0.75*(time-mp_special_timer)/time;
			global.bg_colour = make_color_hsv(137,153,max(154*(1-3*global.speed_manip),0));
		}
		if mp_special_timer < 0
		{
			global.speed_manip = 1;
			global.bg_colour = c_black;
			mp_special_timer = 0;
		}
		break;
	}
	
}
#endregion specials
#endregion functions
#region M A I N 
switch (mp_state)
{
case (0): //no input
{
    mp_null_timer += speed_manip;
    if (!mp_penalty)
    {
        if (b_specP and mp >= special_min and mp_specials_left > 0)
			switch (mp_special)
			{
			case (Special.burst):
	            {mp_burst=true; break;}
			case (Special.slowdown):
				{mp_slowdown = true; break;}
			}
        else if (b_mp)
        {
                if (mp > catch_min)
                {
                    mp_null_timer = 0;
                    mp_state = 1;
                }
        }
        mp += mp_regen*speed_manip;
    }
    break;
}
case (1): //holding down button
{
    mp -= catch_min*global.speed_manip; //let the mp drain slower when slowdown is on
    if (b_mp)
    {
		audio_sound_gain(snd_mp,1,0);
		audio_sound_pitch(snd_mp,mp + 1);
        if (mp < catch_min)
		{
			mp_penalty = true;
			mp_state = 0;
			cam_shake_surface(self,0.5,3,camtype.linear);
		}
    }
    else if (!b_mp) {mp_state = 0; audio_sound_gain(snd_mp,0,0.5);}
    break;
}
}
#endregion main
#endregion mp
#region hp
//vars********************************************************************
//bools
var orgate = (ishurt || hp_cooldown);
//nums
var hp_cooldown_time = 0.25;
var hp_regen = 1/fps;
var hp_invincible_time = 0.01;

//************************************************************************
if (ishurt && !hp_is_invincible)
{
    hp -= hit_amount;
    hp_cooldown = true;
    hp_cooldown_timer = 1;
    hp_is_invincible = true;
    hp_invincible_timer = 1;
    ishurt = false;
    cam_shake_surface(self,0.5,hit_amount*10,camtype.linear);
    //cam_dipback_surf_ext(self,hp_invincible_time*game_get_speed(gamespeed_fps),spr_indicate_depth,0,-1,-1,1);
    
}

if (hp_cooldown)
{
    hp_cooldown_timer -= ((1-hp_cooldown_time)/game_get_speed(gamespeed_fps))*speed_manip;
    if (hp_cooldown_timer <= 0)
        {
        hp_cooldown = false;
        }
}

if (hp_is_invincible)
{
    hp_invincible_timer -= ((1-hp_invincible_time)/game_get_speed(gamespeed_fps))*speed_manip;
    if (hp_invincible_timer <=0)
    {
        hp_is_invincible = false;
    }
}

if !orgate
{
    hp += hp_regen*speed_manip;
}
}

if hp <= 0 and !is_dead
{
	is_dead = true;
	lives_left --;
}
#endregion hp
#endregion not dead
#region dead
var death_time = 3*fps;
if is_dead
{
	mp = 1;
	hp = 1;
	global.speed_manip = 0;
	death_timer ++;
	if death_timer < death_time / 3
	{
		fx_explode(surface_get_width(surface),surface_get_height(surface), global.player_layer);
	}
	if death_timer > death_time
	{
		//death_timer = 0;
		is_dead = false;
		hp_is_invincible = true;
		hp_invincible_timer = 2;
	}
}
else if death_timer >= death_time
{
	death_timer ++;
		global.speed_manip = death_timer/(death_time + fps);
	if death_timer > death_time + fps
	{
		global.speed_manip = 1;
		death_timer = 0;
	}
}
#endregion dead
//clamp hp, mp
if (hp >=1) {hp = 1;}
if (hp <=0) {hp = 0;}
if (mp >=1) {mp = 1;}
if (mp <=0) {mp = 0;}
if mp_special_timer < 0 {mp_special_timer = 0;}

if !is_dead
	player_control();

if keyboard_check_pressed(vk_control) {mp_special ++; if mp_special > num_specials-1 {mp_special = 0;}}
if mouse_wheel_up() {global.autoaim += 0.0001;}
if mouse_wheel_down() {global.autoaim -= 0.0001;}
