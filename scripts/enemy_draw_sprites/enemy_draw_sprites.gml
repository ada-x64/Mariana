///@function enemy_draw_sprites(type, surface)
///@param {enum} type
///@param {surface} surface
var type = argument0;
var ww = surface_get_width(argument1)
var hh = surface_get_height(argument1)
var xx = ww/2 - sprite_get_width(mask_index)/2;
var yy = hh/2 - sprite_get_height(mask_index)/2;
//* * * DRAW THE SPRITES * * * *******************************************
switch (type)
{
    case (Etype.heart):
    {
        draw_sprite_palette_ext(sprE_heart_pump,image_index, xx-2, yy, 1, 1, spr_rot, c_white, 1, pal[Pal.yellow]);
        draw_sprite_palette_ext(sprE_heart_metal,image_index, xx , yy, 1, 1, spr_rot, c_white, 1, pal[Pal.grayscale]);
        draw_sprite_palette_ext(sprE_heart_flesh,image_index, xx , yy, 1, 1, spr_rot, c_white, 1, pal[level_pal]);
        break;
    }
    case (Etype.heart_left):
    {
        draw_sprite_palette_ext(sprE_heart_pump,image_index, xx-2, yy, 1, 1, spr_rot, c_white, 1, pal[Pal.yellow]);
        draw_sprite_palette_ext(sprE_heart_metal,image_index, xx , yy, 1, 1, spr_rot, c_white, 1, pal[Pal.grayscale]);
        break;
    }
    case (Etype.heart_right):
    {
        draw_sprite_palette_ext(sprE_heart_half_flesh,image_index, xx, yy, 1, 1, spr_rot, c_white, 1, pal[level_pal]);
        draw_sprite_palette_ext(sprE_heart_half_goop,image_index,  xx, yy, 1, 1, spr_rot, c_white, 1, pal[Pal.red])
        break;
    }
    default:
    {
        draw_sprite_palette_ext(sprite_index,image_index, xx, yy, 1, 1, spr_rot, c_white, 1, pal[level_pal]);
        break;
    }
}

//DRAW THE HP BARS *******************************************************
if (global.show_enemy_hp)
{
    for (var i=1; i<type_hp+1; i++)
    {
        var image;
        var hp_y = yy + ( sprite_get_bbox_bottom(mask_index) ) + 3 ;
        var hp_x = xx + sprite_get_bbox_left(mask_index) + (sprite_get_bbox_right(mask_index)-sprite_get_bbox_left(mask_index))/2  - ( (sprite_get_width(sprE_hp)-1)*(type_hp)/2 );
        if (i>hp) {image = 1;}
        else {image = 0;}
        draw_sprite_palette(sprE_hp,image,hp_x+(sprite_get_width(sprE_hp)-1)*(i-1),hp_y,level_pal);
    }
}
