if !DEV_TERMINAL.is_open and !global.paused and !global.unfocused
	timer ++;
if instance_exists(forcefield)
{
	with forcefield
		{radius = 128}//*timer/(fps*4)}
}

draw_set_color(make_color_hsv(255*timer/fps,255,255));
for (var i = 0; i < 2*fps; i+=fps/4)
{
	if timer > i
	draw_circle(global.playarea_midx,global.playarea_midy,global.playarea_width*(timer-i)/fps,1);
}

draw_set_alpha(1);
global.bg_alpha = 0;

if timer > fps and timer < fps*4
{
	var t = (timer - fps)/(fps*3)
	if !DEV_TERMINAL.is_open and !global.paused and !global.unfocused
	{	var hx = 3*(1-t)*choose(1,-1);
		var hy = 3*(1-t)*choose(1,-1);	}
	else {hx = 0; hy = 0;}
	draw_set_alpha(t)
	surface_set_target(surf);
	draw_clear_alpha(c_black,0.25);
	draw_set_palette(global.level_pal)
	draw_sprite(spr_bigEyeBase,0,32+hx,32+hy)
	draw_sprite(spr_bigEyeBlink,2 + (sprite_get_number(spr_bigEyeBlink) - 1)*t,32+hx,32+hy)
	draw_reset_palette();
	surface_reset_target();
	draw_surface(surf,x-32,y-32)
	global.bg_alpha = t
}
if timer > fps*4 {global.bg_alpha = 1;}
if timer == fps*4
{
	var xx = global.playarea_midx;
	var yy = global.playarea_midy;
	instance_create_layer(xx,yy,global.enemy_layer,objE_bossTestCenter);
	var e;
	for (var i = 0; i < 10; i++)
	{
		e = instance_create_layer(xx,yy,global.enemy_layer,objE_bossTestPeripheral);
		with e {peripheralNumber = i;}
}
}

if timer > fps*4 and timer < fps*11
{
	var t = 1-(timer - fps*4)/(fps*7)
	draw_set_alpha(t);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_zoom);
	var str = "ANXIETY\nthe judging eye"
	var xx = display_get_gui_width()/2;
	var yy = global.playarea_y1;
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_black);
	draw_text(xx,yy-1,str);
	gpu_set_blendmode(bm_max);
	draw_set_color(c_white);
	draw_text(xx,yy,str);
	gpu_set_blendmode(bm_normal);
}

draw_set_alpha(1);
draw_set_color(c_white);
