///@function cam_shake(duration <secs.>, intensity, type)
///@param duration
///@param intensity
///@param type
with CAM
{
shake = true;
i_shake = argument1;
d_shake = argument0*game_get_speed(gamespeed_fps);
shakeType = argument2;
}
