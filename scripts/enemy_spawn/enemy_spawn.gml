///@function enemy_spawn(E index, x, y)
///@param E_index
///@param x
///@param y
show_debug_message("Spawning enemy at ("+string(argument1)+", "+string(argument2)+")...");
var enemy = argument0;
instance_activate_object(enemy);
enemy.x = argument1;
enemy.y = argument2;
enemy.index = instance_number(objE_parent);
