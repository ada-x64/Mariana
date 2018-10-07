//draw laser
if timer >= 0
{
	draw_set_alpha(0.8);
	draw_set_color(c_white);
	draw_triangle(a,b,c,d,g,h,0);
	draw_triangle(e,f,g,h,a,b,0);
}
if timer < 0
{
	if timer % 8 == 0
	{
		var aa = xx + lengthdir_x(width*timer/(fps),dir+90);
		var bb = yy + lengthdir_y(width*timer/(fps),dir+90);
		var cc = xx + lengthdir_x(width*timer/(fps),dir-90);
		var dd = yy + lengthdir_y(width*timer/(fps),dir-90);
		var ee = aa + lengthdir_x(W,dir);
		var ff = bb + lengthdir_y(W,dir);
		var gg = cc + lengthdir_x(W,dir);
		var hh = dd + lengthdir_y(W,dir);
		draw_set_alpha(0.5);
		draw_set_color(c_white);
		draw_triangle(aa,bb,cc,dd,gg,hh,0);
		draw_triangle(ee,ff,gg,hh,aa,bb,0);
		draw_set_alpha(1);
	}
	
	if timer % 3 == 0
	{
		var dd = distance_to_point(objM.x,objM.y) * 3/4;
		draw_sprite(spr_warning,0,x+lengthdir_x(dd,dir),y+lengthdir_y(dd,dir));
	}
	
}