///initialize vars
#region position and movement
x = room_width/2;
y = room_height/2;
player_init_control();
/*
control_mode = "keyboard"
if gamepad_is_connected(0)
	control_mode = "gamepad"

fric = 0;
xspd = 0;
yspd = 0;
dpad_enabled = true;
lv = 0;
lh = 0;
dodge = false;
dodge_timer = 0;
dir = 0;
yspd_store = 0;
xspd_store = 0;*/
#endregion pos and mov
#region mp vars
//general
mp = 1;
clamp(mp,0,1);
mp_penalty = false;
mp_cooldown = false;
mp_state = 0;
mp_null_timer = 0;
mp_penalty_timer = 0;
mp_dir = 0;
test = false;
snd_mp = audio_play_sound(sfx_mp,0,1);
audio_sound_gain(snd_mp,0,0);
audio_sound_pitch(snd_mp,1);
#region specials
enum Special
{
	burst,
	slowdown
}
num_specials = 2;
mp_special = Special.burst;
mp_special_timer = 0;
mp_specials_left = 3;
mp_specials_total = 3;
mp_burst = false;
mp_slowdown = false;
level_pal = global.level_pal;
#endregion specials
#endregion mp vars
#region hp vars
//bools
ishurt = false;
hp_cooldown = false;
hp_is_invincible = false;
is_dead = false;
//nums
hp = 1;
hit_amount = 0;
hp_cooldown_timer = 0;
hp_invincible_timer = 0;
death_timer = 0;
lives_left = 3;
#endregion mp vars
#region surface and drawing
spr_rot = 0;
image_speed = 6/game_get_speed(gamespeed_fps);
gpu_set_texfilter(0);
surface = surface_create(64,64);
surface_mp = surface_create(64,64);
script_execute(init_surface_cam,64,64,0,0,0);
layer = global.player_layer;

/*
#region particles
ps = part_system_create_layer(global.player_layer,false);
#region trail
pt_trail = part_type_create();
#endregion trail
#region special ready
pt_special = part_type_create();*/
part_timer_special = 0;
/*
#endregion special ready
#endregion particles */
#region talkbox
full_text = "";
text = "";
text_bold = "";
text_italic = "";
talk_time = 0;
talk_timer = 0;
text_pos = 0;
text_wait = false;
text_wait_timer = 0;
text_wait_time = 60;
textbox_sfx = sfx_text_voice;
talkbox_font = fnt_talkbox;
port_image_index = 0;
port_image_speed = 10/fps;
port = spr_port_mariana;
var xx = display_get_gui_width()/2 - sprite_get_width(spr_talkbox)/2 + 64 + 8;
var yy = display_get_gui_height() - sprite_get_height(spr_talkbox) + 3;
var ww = display_get_gui_width()/2 + sprite_get_width(spr_talkbox)/2 - xx
var hh = display_get_gui_height() - yy;
surf_text = surface_create(ww,hh);
#endregion talkbox
#endregion surface and drawing
#region misc and globals
global.speed_manip = 1;
global.show_enemy_hp = true;
global.autoaim = 0.05;
#endregion