///draw_set_palette(palette number)
//parameters ******************************************************************
var offset = argument0/background_get_height(bg_palettes);
//set up shader ***************************************************************
gpu_set_texfilter(0);

float_offset    = shader_get_uniform(shdr_palette_swap,"offset");
tex_pal         = background_get_texture(bg_palettes);
samp2D_pal      = shader_get_sampler_index(shdr_palette_swap,"samp2D_pal");

//start drawing to shader *****************************************************
shader_set(shdr_palette_swap);
texture_set_stage(samp2D_pal, tex_pal);
shader_set_uniform_f(float_offset,offset);

//things are drawn from here; make sure to reset the shader!!!
