#region checks
if (global.level == Level.none)
{
	surface_free(surf3D);
	exit;
}
if !surface_exists(surf3D)
    {
    surf3D = surface_create(surf3D_size,surf3D_size);
    }
#endregion checks
#region draw to surface
surface_set_target(surf3D);
d3d_start();
    {
    draw_clear_alpha(c_black,0);
    var WIDTH = surf3D_size;
    var HEIGHT = surf3D_size;
    d3d_set_projection_perspective(0,0,WIDTH,HEIGHT,0);
    d3d_transform_set_identity();
    d3d_transform_add_rotation_x(180);
    d3d_transform_add_translation(0,HEIGHT,0);
    d3d_transform_add_scaling(1,1,-1);
    
    //settings
    d3d_set_depth(0);
    d3d_set_culling(false);
    d3d_set_hidden(false);
    fog_depth = background_get_height(tex_grid)* (2);
    
    //draw the thing!
    d3d_bg_grid();
    //reset projection
    d3d_set_lighting(false);
    d3d_set_fog(false,c_white,0,0);
    d3d_transform_set_identity();
    d3d_set_depth(0);
    d3d_set_projection_ortho(0,0,room_width,room_height,0);
    }
d3d_end();
surface_reset_target();
#endregion surface
#region move grid around player position, draw the surface
var val = 45;
if (global.gridType != GridType.ellipse) {val = 90;}
var t = global.bg_rotation + val + 90;
var h = room_width/2;
var k = room_height/2;
var a = room_width/2 - surf3D_size/2;
var b = room_height/2 - surf3D_size/2;
xx = (a-h)*dcos(-t) - (b-k)*dsin(-t) + h;
yy = (a-h)*dsin(-t) + (b-k)*dcos(-t) + k;

var mx = objM.x / (display_get_gui_width()); //(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ));
var my = objM.y / display_get_gui_height(); //(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ));

xx = xx+(2*(mx - 0.5))*(8)
yy = yy+(2*(my - 0.5))*(8)

draw_set_palette(global.level_pal);
draw_surface_ext(surf3D, xx, yy, 1, 1, t, c_white, global.bg_alpha);
draw_reset_palette();
draw_set_alpha(1);
draw_set_alpha(1-global.bg_alpha);
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,0)
#endregion
#region debug

#endregion