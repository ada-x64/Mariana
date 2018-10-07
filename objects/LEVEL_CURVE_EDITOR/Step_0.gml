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
        with (BG_MANAGER) //make sure 0 <= CURVE <= 1
        {
            if (CURVE < 0) {CURVE = 0;}
            else if (CURVE > 1) {CURVE = 1;}
        }
        show_debug_message("Curvature manager END:");
        show_debug_message("CURVE = "+string(BG_MANAGER.CURVE));
        instance_destroy();
        exit;
    }
    var constant = ( (curve-CURVE)/(s) ) * (spd/game_get_speed(gamespeed_fps));
    
    BG_MANAGER.CURVE += constant; //* cam_get_I(s*game_get_speed(gamespeed_fps),1,timer,camtype.hyperbolic);
    //show_debug_message("T="+string(LEVEL_RUNNER.T));
    
}

/* */
/*  */
