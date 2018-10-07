///zoom
//if global.mobile = false
    {
    if keyboard_check_pressed(ord("Z")) && keyboard_check(vk_control)
        {
        zoom++;
        zoom_timer = 2;
        
        if zoom = zoommax
        {
            //ideal_width = round(display_get_width() / ideal_width_original) * ideal_width_original ;
            //ideal_height = round(display_get_height() / ideal_height_original) * ideal_height_original ;
            window_set_fullscreen(true);
        }
        else
        {
            //ideal_width = ideal_width_original;
            //ideal_height = ideal_height_original;
            window_set_fullscreen(false);
        }
        
        if zoom > zoommax
            {zoom = minzoom;}
            
        scr_resize_window(ideal_width,ideal_height,zoom);
        }
    }
    
if zoom_timer > 0
    {
    zoom_timer -= 1/game_get_speed(gamespeed_fps);
    }

///set room speed
game_set_speed(60,gamespeed_fps);

if instance_exists(C) and C.startP and !global.unfocused and !DEV_TERMINAL.is_open
{
	switch global.paused
	{
		case false:
			global.paused = true; break;
		case true:
			global.paused = false; break;
	}
}
