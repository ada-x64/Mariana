if (global.paused or global.unfocused or DEV_TERMINAL.is_open) exit;

barr = enemy_spawn_bullet(barr);

type		= barr[Barr.type];
spd			= barr[Barr.spd];
dir			= barr[Barr.dir];
curve		= barr[Barr.curve];
lifespan	= barr[Barr.lifespan];
immune		= barr[Barr.immune];

if keyboard_check_released(ord("Q")) {type ++;}
if keyboard_check_released(ord("A")) {type --;}
if type < 0 {type = global.btype_count-1;}
if type > global.btype_count-1 {type = 0;}
if keyboard_check(ord("W")) {spd += 0.1;}
if keyboard_check(ord("S")) {spd -= 0.1;}
if keyboard_check(ord("E")) {dir += 1;}
if keyboard_check(ord("D")) {dir -= 1;}
if keyboard_check(ord("R")) {curve += 0.1;}
if keyboard_check(ord("F")) {curve -= 0.1;}
if keyboard_check(ord("T")) {lifespan += 0.1;}
if keyboard_check(ord("G")) {lifespan -= 0.1;}
if keyboard_check(ord("Y")) {freq +=0.1;}
if keyboard_check(ord("H")) {freq -=0.1;}
if lifespan < -1 {lifespan = -1;}
if lifespan >-1 and lifespan < 0 {lifespan = 0;}
if keyboard_check_released(vk_space) {immune = !immune;}

barr[Barr.type]		= type;
barr[Barr.spd]		= spd;
barr[Barr.dir]		= dir;
barr[Barr.freq]		= freq;
barr[Barr.curve]	= curve;
barr[Barr.lifespan] = lifespan;
barr[Barr.immune]	= immune;