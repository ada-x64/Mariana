/**/
if is_hurt {pal = Pal.red;}
else pal = global.level_pal;
draw_set_palette(pal);
draw_sprite_ext(sprite_index,image_index,x+hx,y+hy,1,1,spr_rot,c_white,1);
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
		draw_set_palette(pal);
		draw_sprite(sprE_hp,image,hp_x+(sprite_get_width(sprE_hp)-1)*(i-1),hp_y);
		draw_reset_palette();
    }
}