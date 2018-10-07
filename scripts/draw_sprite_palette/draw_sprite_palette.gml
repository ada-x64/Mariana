///draw_sprite_palette(sprite,image,x,y,palette)
///@param sprite
///@param image
///@param xx
///@param yy
///@param pal
//parameters ******************************************************************
var sprite  = argument[0];
var image   = argument[1];
var xx      = argument[2];
var yy      = argument[3];
var palette = argument[4];
//*****************************************************************************
//set the stage ***************************************************************
//sampler vars
gpu_set_texfilter(0);
tex_pal     = background_get_texture(bg_palettes);
samp2D_pal  = shader_get_sampler_index(shdr_palette_swap,"samp2D_pal");
//draw the sprite *************************************************************
shader_set(shdr_palette_swap);
{
    //set texture stage
    texture_set_stage(samp2D_pal, tex_pal);
    //set floats
    float_offset = shader_get_uniform(shdr_palette_swap,"offset");
    offset = palette/(background_get_height(bg_palettes));
    shader_set_uniform_f(float_offset,offset);
    //draw the sprite
    draw_sprite(sprite,image,xx,yy);
}
shader_reset();

/*
show_debug_message("offset="+string(offset));
show_debug_message("samp2D_pal="+string(samp2D_pal));
show_debug_message("tex_pal="+string(tex_pal));
