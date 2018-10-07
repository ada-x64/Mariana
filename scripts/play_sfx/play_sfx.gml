///@function play_sfx(index, priority, volume, pitch)
///@param index
///@param priority
///@param vol
///@param pitch
if !AUDIO_MANAGER.mute_sfx
{
	audio_sound_gain(argument0,argument2,0);
	audio_sound_pitch(argument0,argument3);
	audio_play_sound(argument0,argument1,false);
}