///circle precision
draw_set_circle_precision(12);

if DEV_TERMINAL.is_open or global.paused or global.unfocused
{
	part_system_automatic_update(global.ps_player,false);
	part_system_automatic_update(global.ps_enemy,false);
	part_system_automatic_update(global.ps_bullet,false);
	part_system_automatic_update(global.ps_background,false);
}
else
{
	part_system_automatic_update(global.ps_player,true);
	part_system_automatic_update(global.ps_enemy,true);
	part_system_automatic_update(global.ps_bullet,true);
	part_system_automatic_update(global.ps_background,true);
}

part_system_layer(global.ps_player,global.player_layer);
part_system_layer(global.ps_enemy,global.enemy_layer);
part_system_layer(global.ps_bullet,global.bullet_layer);
part_system_layer(global.ps_background,global.background_layer);