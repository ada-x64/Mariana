///@function make_curve(x1,y1,x2,y2,curvature)
///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg curvature

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var curve = argument4;

var path = path_add();
path_add_point(path,x1,y1,100);

var r = sqrt(sqr(y2-y1)+sqr(x2-x1))/2;
var dir = darctan2(y2-y1,x2-x1);
var u = (x1+x2)/2 + lengthdir_x(curve*r,dir+90);
var v = (y1+y2)/2 - lengthdir_y(curve*r,dir+90);
path_add_point(path,u,v,100);

path_add_point(path,x2,y2,100);

path_set_kind(path,1);
path_set_closed(path,false);

return path;