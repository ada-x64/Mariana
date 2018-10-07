///init
if instance_number(object_index) > 1 {instance_destroy(self);}
mus = "";
mute = true;
mute_sfx = true;
audio_group_load(audiogroup_default);
audio_group_load(ag_sfx);
vol_music = 1;
vol_sfx = 1;

mute_timer = 0;
mute_sfx_timer = 0;
mute_time = 60;