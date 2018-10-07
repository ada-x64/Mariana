/// @description debug text
/**
draw_set_font(fnt_debug);
draw_set_halign(fa_right);
var hh = string_height("A");
layer = global.terminal_layer;
draw_text(display_get_gui_width(),0*hh,"ps_player: part_count = "+string(part_particles_count(global.ps_player)))
draw_text(display_get_gui_width(),1*hh,"ps_enemy: part_count = "+string(part_particles_count(global.ps_enemy)))
draw_text(display_get_gui_width(),2*hh,"ps_bullet: part_count = "+string(part_particles_count(global.ps_bullet)))
draw_text(display_get_gui_width(),3*hh,"ps_background: part_count = "+string(part_particles_count(global.ps_background)))

if !part_system_exists(global.ps_player) {show_error("ps_player does not exist!",false)}