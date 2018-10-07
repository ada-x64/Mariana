///@function enemy_leave(index, speed, x, y)
///@param index
///@param speed
///@param x
///@param y
/*
var index   = argument0;
var spd     = argument1;
var leave_x = argument2;
var leave_y = argument3;
var length  = point_distance(index.x,index.y,leave_x,leave_y);
var dir     = point_direction(index.x,index.y,leave_x,leave_y);

enemy_set_path(index,length,-dir,make_curve(0.5,0),spd, path_action_stop);
index.is_leaving = true;
