if (DEV_TERMINAL.is_open or global.paused or global.unfocused) {exit;}
if point_in_circle(objM.x,objM.y,x,y,radius)
{
	in_radius = true;
	var dist = force * (1 - distance_to_point(objM.x,objM.y)/radius);
	dir = point_direction(x,y,objM.x,objM.y)
	objM.x += lengthdir_x(force,dir);
	objM.y += lengthdir_y(force,dir);
}
else {in_radius = false;}

if lifespan == -1 exit;
timer ++;
if timer > lifespan
{
	instance_destroy();
}