///cam_zoom_surface(object, focus, in duration <secs>, pause duration, out duration, in type, out type, intensity)
with (argument0)
{
z_focus = argument1;
z_d1 = argument2*game_get_speed(gamespeed_fps);
z_d2 = argument4*game_get_speed(gamespeed_fps);
z_dp = argument3*game_get_speed(gamespeed_fps);
z_type1 = argument5;
z_type2 = argument6;
z_i = argument7;
surfZoom = true;
}
