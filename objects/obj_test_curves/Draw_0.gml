if mouse_check_button(mb_left) {x1 = mouse_x; y1 = mouse_y;}
if mouse_check_button(mb_right) {x2 = mouse_x; y2 = mouse_y;}
if mouse_wheel_up() {curve += 0.1;}
if mouse_wheel_down() {curve -= 0.1;}

r = sqrt(sqr(y2-y1)+sqr(x2-x1))/2;
dir = darctan2(y2-y1,x2-x1);
p = 9;
u = (x1+x2)/2 + lengthdir_x(curve*r,dir+90);
v = (y1+y2)/2 - lengthdir_y(curve*r,dir+90);
draw_set_color(c_red);
draw_line(x1,y1,u,v);
draw_set_color(c_yellow);
draw_line(x2,y2,u,v);
draw_set_color(c_green);
draw_line(u,v,(x1+x2)/2,(y1+y2)/2);
draw_set_color(c_white);
draw_line(x1,y1,x2,y2);
draw_text(x1,y1,"(1)");
draw_text(x2,y2,"(2)");

p = 10;
U = array_create(p);
V = array_create(p);
for (var i = 0; i<=p; i++)
{
	//makes a semicircle. needs to scale inversely as it moves away from the center.
	//p/2 - i
	var val = curve-(2*curve/p)*abs(i-p/2);
	U[i] = (x1+x2)/2 + lengthdir_x((r+val)*curve,dir+180*(i/p));
	V[i] = (y1+y2)/2 - lengthdir_y((r+val)*curve,dir+180*(i/p));
}
for (var i = 0; i<p; i++)
{
	draw_set_color(make_color_hsv(i*10,255,255));
	draw_line(U[i],V[i],U[i+1],V[i+1]);
}


draw_sprite(spr_console_cursor,0,mouse_x,mouse_y);

draw_self();
if keyboard_check_pressed(vk_shift)
{
	path_start(make_curve(x1,y1,x2,y2,curve),1,path_action_reverse,true);
}