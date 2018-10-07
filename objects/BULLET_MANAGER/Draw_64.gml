///draw to bullet surface
if !layer_exists(global.bullet_layer)
	{global.bullet_layer = layer_create(50,"bullet layer");}
if layer != global.bullet_layer
	{layer = global.bullet_layer;}
	
var image = 0;
surface_set_target(global.surf_bullets);
for (var i=0; i< ds_list_size(global.bullet_list_M); i++)
{
        //get values
        var arr = ds_list_find_value(global.bullet_list_M,i);
        var bx,by,dir,type;
        bx          = arr[0];
        by          = arr[1];
        dir         = arr[4];
        type        = arr[6];
		
		if string_count("bomb",global.btype[type]) != 0 {image = 1;}
		else if string_count("tracking",global.btype[type]) != 0 {image = 2;}
		
        draw_set_alpha(1);
        draw_sprite_palette_ext(sprM_bullet,image,round(bx),round(by),1,1,dir,c_dkgray,1,global.level_pal);
		
}
for (var i=0; i< ds_list_size(global.bullet_list_i); i++)
{
        //get values
        var arr = ds_list_find_value(global.bullet_list_i,i);
        var bx,by,dir,type;
        bx          = arr[0];
        by          = arr[1];
        dir         = arr[4];
        type        = arr[6];
		
		if string_count("bomb",global.btype[type]) != 0 {image = 1;}
		else if string_count("tracking",global.btype[type]) != 0 {image = 2;}
		
        draw_set_alpha(1);
        draw_sprite_palette_ext(spr_bullets_i,image,round(bx),round(by),1,1,dir,c_dkgray,1,global.level_pal);
		
}
for (var i=0; i< ds_list_size(global.bullet_list); i++)
{
        //get values
        var arr = ds_list_find_value(global.bullet_list,i);
        var bx,by,dir,type;
        bx          = arr[0];
        by          = arr[1];
        dir         = arr[4];
        type        = arr[6];
		
        if string_count("bomb",global.btype[type]) != 0 {image = 1;}
		else if string_count("tracking",global.btype[type]) != 0 {image = 2;}
		else image = 0;
        draw_set_alpha(1);
        draw_sprite_palette_ext(spr_bullets,image,round(bx),round(by),1,1,dir,c_white,1,global.level_pal);
}
surface_reset_target();

///surfaces
if surface_exists(global.surf_bullets)
	draw_surface(global.surf_bullets,0,0);
else
	global.surf_bullets = surface_create(room_width,room_height);