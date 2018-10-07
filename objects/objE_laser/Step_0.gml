xx = x + lengthdir_x(dist,dir);
yy = y + lengthdir_y(dist,dir);
a = xx + lengthdir_x(width,dir+90);
b = yy + lengthdir_y(width,dir+90);
c = xx + lengthdir_x(width,dir-90);
d = yy + lengthdir_y(width,dir-90);
e = a + lengthdir_x(W-dist2,dir);
f = b + lengthdir_y(W-dist2,dir);
g = c + lengthdir_x(W-dist2,dir);
h = d + lengthdir_y(W-dist2,dir);

timer += global.speed_manip;
if timer >=	lifespan*fps and lifespan != -1
{
	dist += spd;
	if dist >= W
		instance_destroy();
}
if timer > 0
	dist2 -= spd;
if dist2 >= W {dist2 = W;}


if room = rm_test_curves
{
	x = room_width/2;
	y = room_height/2;
	if keyboard_check(vk_up) dir+=0.5;
	if keyboard_check(vk_down) dir-=0.5;
	if keyboard_check(vk_left) width ++;
	if keyboard_check(vk_right) width --;
}
else
{
	var mx = objM.x;
	var my = objM.y;
	if point_in_triangle(mx,my,a,b,c,d,e,f) or point_in_triangle(mx,my,e,f,g,h,a,b)
	{
		objM.hp -= 0.05;
	}
}