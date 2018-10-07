///cam_zoom(focus, in duration <secs>, out duration <secs>, in type, out type, intensity)
with (CAM)
{
z_focus = argument0;
z_d1 = argument1*game_get_speed(gamespeed_fps);
z_d2 = argument2*game_get_speed(gamespeed_fps);
z_type1 = argument3;
z_type2 = argument4;
z_i = argument5;
zoom = true;
}
