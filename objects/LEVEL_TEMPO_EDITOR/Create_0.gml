///pause
if (DEV_TERMINAL.is_open || global.unfocused)
{
    exit;
}

///init vars
T = 0; //old tempo
t = 0; //new tempo
s = 0; //steps to get there
timer = 0;
spd = LEVEL_RUNNER.tl_speed;

