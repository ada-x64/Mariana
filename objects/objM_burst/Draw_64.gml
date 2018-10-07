if !surface_exists(surf)
{surf = surface_create(room_width,room_height);}

surface_set_target(surf);
{
    draw_clear_alpha(c_white,0);
    draw_set_circle_precision(24)
    gpu_set_blendmode(bm_max);
    draw_set_alpha(1-(r/size));
    draw_circle_colour(x,y,r,c_black,c_white,0);
    gpu_set_blendmode(bm_normal);
    draw_set_circle_precision(12);
}
surface_reset_target();

draw_surface(surf,0,0);

