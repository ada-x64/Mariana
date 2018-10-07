draw_set_font(fnt_debug);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(0,0,"dir="+string(dir)+"; xspd = "+string(xspd)+", yspd = "+string(yspd));
draw_arrow(x,y,x+lengthdir_x(32,mp_dir),y+lengthdir_y(32,mp_dir),8);

draw_sprite(spr_console_cursor,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));