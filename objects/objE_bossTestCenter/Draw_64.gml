draw_set_circle_precision(16);
draw_set_color(make_color_hsv(255*sin(ctimer*pi/1000),255,255));
if is_hurt {draw_set_color(c_red); ctimer = 0;}
else if !(DEV_TERMINAL.is_open or global.unfocused or global.paused)
	{ctimer ++;}
draw_set_alpha(min(timer/(fps*4),1))
draw_circle(x+hx,y+hy,128,1);
for (var i = 1; i < 8; i ++)
{
	draw_circle(x+hx,y+hy,120*sin(pi*i*timer/1000),1);
}

var dir = point_direction(x,y,objM.x,objM.y);
draw_set_palette(global.level_pal);
draw_sprite(spr_bigEyeBase,0,x+hx,y+hy);
var spr;
if is_hurt
{
	sprite_index = spr_bigEyeHurt;
	image_speed = 1;
}
else 
{
	sprite_index = spr_bigEyeBlink;
	image_speed = 0 image_index = 0;
}

draw_sprite(sprite_index,image_index,x+lengthdir_x(4,dir),y+lengthdir_y(4,dir));

//draw_sprite_ext(sprite_index,image_index,x,y,1,1,dir+180,c_white,1);

draw_reset_palette();


if (global.show_enemy_hp)
{
    for (var i=1; i<hp+1; i++)
    {
        var image;
        var hp_y = y + sprite_height/2 + 3 ;
        var hp_x = x - ((sprite_get_width(sprE_hp)-1)*(hp)/2 );
        if (i>max_hp) {image = 1;}
        else {image = 0;}
		draw_set_palette(global.level_pal);
		draw_sprite(sprE_hp,image,hp_x+(sprite_get_width(sprE_hp)-1)*(i-1),hp_y);
		draw_reset_palette();
    }
}