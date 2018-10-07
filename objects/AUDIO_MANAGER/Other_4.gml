///set mus

if (global.level == Level.none && room != rm_title)
{
	audio_stop_sound(mus);
    mus = audio_play_sound(mus_dream_arcade_loop,100,1);
}
else if (room == rm_title)
{
	audio_stop_sound(mus);
    mus = audio_play_sound(mus_title_test,100,1);
}
else
	{audio_stop_all();}

