///load level, play music
if instance_number(object_index) > 1 {instance_destroy(self);}
exitval = false;

switch(global.level)
{
    case Level.none:
    {
		exitval = true;
		exit;
		break;
	}
    case Level.boot:
    {
        lvl = "boot.txt";
        mus = noone;
		break;
    }
    case Level.test:
    {
        lvl = "level.txt";
        mus = mus_retrowave_test_loop;
		//global.level_pal = Pal.purple_blue;
		break;
		//exitval = true;
		//exit;
    }
    case Level.enemy_test:
    {
        lvl = "enemy_test.txt";
        mus = mus_retrowave_test_loop;
		//global.level_pal = irandom(global.palette_count-1);
		break;
		//exitval = true;
		//exit;
    }
    case Level.boss_test:
    {
        lvl = "boss_test.txt";
        mus = mus_retrowave_test_loop;
		global.level_pal = Pal.yellow_purple;
		//global.level_pal = irandom(global.palette_count-1);
		break;
		//exitval = true;
		//exit;
    }
    case Level.retrowave_test_level:
    {
        lvl = "retrowave_test_level.txt";
        mus = mus_retrowave_test_loop;
		global.level_pal = Pal.purple_blue;
		break;
		//exitval = true;
		//exit;
    }
}

level_load(lvl);
with (AUDIO_MANAGER)
    {mus = audio_play_sound(other.mus,100,1);}

///set vars

bps = 1;
T = 60;
tl_timer = 0;

global.bps = bps;
global.T = T;

