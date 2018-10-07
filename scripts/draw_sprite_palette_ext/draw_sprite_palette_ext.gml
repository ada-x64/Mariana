///draw_sprite_palette_ext(sprite,image,x,y,xscale,yscale,rotation,colour,alpha,palette)
///@param sprite
///@param image
///@param x
///@param y
///@param xscale
///@param yscale
///@param rotation
///@param colour
///@param alpha
///@param palette
//parameters ******************************************************************
var sprite  = argument0;
var image   = argument1;
var xx      = argument2;
var yy      = argument3;
var xsc     = argument4;
var ysc     = argument5;
var rot     = argument6;
var col     = argument7;
var alph    = argument8;
var palette = argument9;
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
    draw_sprite_ext(sprite,image,xx,yy,xsc,ysc,rot,col,alph);
}
shader_reset();

/*
show_debug_message("offset="+string(offset));
show_debug_message("samp2D_pal="+string(samp2D_pal));
show_debug_message("tex_pal="+string(tex_pal));
