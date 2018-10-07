///reset_mouse_pos()
if (instance_exists(objM))
    {window_mouse_set((objM.x/display_get_gui_width()) * window_get_width(),(objM.y/display_get_gui_height()) * window_get_height());}
