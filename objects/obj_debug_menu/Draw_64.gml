///draw menu

cursor_sprite = spr_console_cursor;

draw_set_font(fnt_debug);
draw_set_colour(c_white);
draw_set_halign(fa_left);

for (var i=0; i<room_last; i ++)
{
    var indicator = ""
    
    if (device_mouse_y_to_gui(0) >= (i/room_last * display_get_gui_height()) && device_mouse_y_to_gui(0) < ((i+1)/room_last * display_get_gui_height()))
    {
        indicator = ">";
        if mouse_check_button_pressed(mb_left)
        {
            room_goto(i);
        }
    }
    
    draw_text(display_get_gui_width()/2,(i/room_last)*display_get_gui_height(),string_hash_to_newline(indicator+room_get_name(i)));
}

