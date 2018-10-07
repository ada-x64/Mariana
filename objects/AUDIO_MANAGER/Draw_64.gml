/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_zoom);
draw_set_color(c_white);
if mute 
{
	mute_timer ++;
	if mute_timer > 50 {mute_timer = 50;}
	draw_set_alpha((mute_time - mute_timer)/mute_time)
	draw_text(display_get_gui_width()-string_width("music muted"),8,"music muted")
}
else mute_timer = 0;
if mute_sfx
{
	mute_sfx_timer ++;
	if mute_sfx_timer > 50 {mute_sfx_timer = 50;}
	draw_set_alpha((mute_time - mute_sfx_timer)/mute_time)
	draw_text(display_get_gui_width()-string_width("sfx muted"),16,"sfx muted")
}
else mute_sfx_timer = 0;

draw_set_alpha(1);