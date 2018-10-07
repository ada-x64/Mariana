draw_set_alpha(1);
depth = -1000
if global.paused
{
	draw_set_alpha(0.5)
	draw_set_color(c_black);
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),0);
	draw_set_alpha(1);
	draw_set_font(fnt_zoom);
	draw_set_color(c_white);
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2,"PAUSE")
}

if zoom_timer > 0
    {
    draw_set_font(fnt_zoom);
    draw_set_colour(c_white);
    draw_set_alpha(zoom_timer);
    draw_set_valign(fa_top);
    draw_set_halign(fa_right);
    draw_text(display_get_gui_width()-5,5,string_hash_to_newline("ZOOM x"+string(zoom)));
    }
draw_set_alpha(1);
draw_set_halign(fa_left);