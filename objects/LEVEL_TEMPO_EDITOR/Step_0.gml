///run
if (run)
{
    timer += spd;
    
    if (timer > s*game_get_speed(gamespeed_fps))
    {
        run = false;
        show_debug_message("tempo manager END:");
        LEVEL_RUNNER.T = round(LEVEL_RUNNER.T);
        show_debug_message("T = "+string(LEVEL_RUNNER.T));
        instance_destroy();
        exit;
    }
    
    LEVEL_RUNNER.T += ( (t-T)/(s) ) * (spd/game_get_speed(gamespeed_fps));
    //show_debug_message("T="+string(LEVEL_RUNNER.T));
    
}

