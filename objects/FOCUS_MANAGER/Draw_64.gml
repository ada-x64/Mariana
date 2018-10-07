if global.unfocused = true
    {
    draw_sprite(spr_console_cursor,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
    draw_set_colour(c_black)
    draw_set_alpha(0.5)
    draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),0);
    }

