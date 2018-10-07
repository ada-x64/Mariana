draw_set_color(c_white);
if is_hurt {draw_set_color(c_red);}
timer++;
if round(timer) % fps >= 0 and round(timer) % fps <= fps/4
{
	hx = random(min(2 + round((10-objE_bossTestCenter.hp)/2),4)-hp);
	hy = random(min(2 + round((10-objE_bossTestCenter.hp)/2),4)-hp);
}
draw_rectangle(x-24+hx,y-24+hy,x+24+hx,y+24+hy,1);

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

//draw_arrow(x,y,x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),8);