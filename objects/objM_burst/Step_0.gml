///pause
if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
{exit;}

r += (size/(game_get_speed(gamespeed_fps)))*global.speed_manip;

if (r >= size)
{
    instance_destroy();
}