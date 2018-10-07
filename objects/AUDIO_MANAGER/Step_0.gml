///stop music if unfocused or paused
if ( keyboard_check_pressed(ord("M")) and !global.unfocused and !DEV_TERMINAL.is_open )
{
	mute_timer = 1;
    mute = !mute;
}
if ( keyboard_check_pressed(ord("N")) and !global.unfocused and !DEV_TERMINAL.is_open )
{
    mute_sfx = !mute_sfx;
}

if (global.unfocused || DEV_TERMINAL.is_open || global.paused)
{
    audio_pause_all();
}
else
{
    audio_resume_all();
}

if mute
	{audio_group_set_gain(audiogroup_default,0,0.25);}
else
	{audio_group_set_gain(audiogroup_default,vol_music,0.25);}
if mute_sfx
	{audio_group_set_gain(ag_sfx,0,0.25);}
else
	{audio_group_set_gain(ag_sfx,vol_sfx,0.25);}


#region sfx
audio_sound_pitch(sfx_bumbp,random_range(0.5,0.75))
#endregion sfx