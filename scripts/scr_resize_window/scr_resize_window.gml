///scr_resize_window(ideal_width,ideal_height,zoom)
ideal_width = argument0
ideal_height = argument1
zoom = argument2
surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
display_set_gui_size(ideal_width,ideal_height);

//if global.mobile = false
    {
    window_set_size(ideal_width*zoom,ideal_height*zoom);
    alarm[0] = 1; //center the window
    }
