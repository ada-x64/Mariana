/**/
if is_hurt {pal = Pal.red;}
else pal = global.level_pal;
draw_set_palette(pal);
draw_sprite(sprite_index,image_index,x+hx,y+hy);
draw_reset_palette();
if (global.show_enemy_hp)
{
    for (var i=1; i<hp+1; i++)
    {
        var image;
        var hp_y = y + ( sprite_get_bbox_bottom(mask_index) ) + 3 ;
        var hp_x = x + sprite_get_bbox_left(mask_index) + (sprite_get_bbox_right(mask_index)-sprite_get_bbox_left(mask_index))/2  - ( (sprite_get_width(sprE_hp)-1)*(hp)/2 );
        if (i>max_hp) {image = 1;}
        else {image = 0;}
		draw_set_palette(pal);
		draw_sprite(sprE_hp,image,hp_x+(sprite_get_width(sprE_hp)-1)*(i-1),hp_y);
		draw_reset_palette();
    }
}