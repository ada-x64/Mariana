///pause
if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
{
    exit;
}

///run
if (run)
{
    timer += spd;
    
    if (timer > s*game_get_speed(gamespeed_fps))
    {
        run = false;
        with (BG_MANAGER) //make sure 0 <= ROT < 360
        {
            math_set_epsilon(0.1);
            while (ROT >= 360)
            {
                ROT -= 360;
            }
            while (ROT < 0)
            {
                ROT += 360;
            }
            math_set_epsilon(0);
        }
        show_debug_message("rotation manager END:");
        show_debug_message("ROT = "+string(BG_MANAGER.ROT));
        instance_destroy();
        exit;
    }
    
    var constant = ( (rot-ROT)/(s) ) * (spd/game_get_speed(gamespeed_fps))
    BG_MANAGER.ROT += constant;
    //show_debug_message("global.bg_rotation =" + string(global.bg_rotation));
    
}

