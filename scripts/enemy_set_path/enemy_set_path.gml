///@function enemy_set_path(index, length [px], direction [deg], path, speed, end action)
///@param index
///@param length [px]
///@param direction [deg]
///@param path
///@param speed
///@param end_action
var index   = argument0;
var length  = argument1;
var dir     = argument2;
if path_exists(argument3)
    {var path = path_duplicate(argument3);}
else
    {var path = global.path_idle;}
var spd     = argument4;
var end_act = argument5;

with (index)
    {
    path_end();
    if (path_exists(path_index))
        {path_delete(path_index);}
    path_start(path,spd,end_act,false);
    path_rotate(path,-dir);
    path_scale = length;
    pathspd = spd;
    }
