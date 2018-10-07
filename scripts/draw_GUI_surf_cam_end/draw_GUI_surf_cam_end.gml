///draw_GUI_surf_cam_end(x translation [opt],y translation [opt])
var surfWidth = surface_get_width(surface) ;
var surfHeight = surface_get_height(surface);

if (argument_count == 2)
{
    var xx = argument[0];
    var yy = argument[1];
}
else 
{
    var xx = 0;
    var yy = 0;
}



//dip back ***************************************************************
var d_transtime = 0.025;
var dip_depth = 50;
if (surfDipBack)
{
    vDipBack = true;
    d_dip -= 2*d_transtime;
    if (d_dip < 2*d_transtime)
        {d_dip = 2*d_transtime;}
    t_dip = d_dip;
    t_dip_transition = d_transtime;
    surfDipBack = false;
}
if (vDipBack)
{
    if (t_dip > 0 && t_dip_transition > 0)
    {
        t_dip_transition -= 1/game_get_speed(gamespeed_fps);
        z = (1-(t_dip_transition/d_transtime))*dip_depth;
    }
    else if (t_dip > 0 && t_dip_transition <=0)
    {
        t_dip_transition = 0;
        z = dip_depth;
        t_dip -= 1;
    }
    else if (t_dip <= 0 && t_dip > -1 && t_dip_transition == 0)
    {
        t_dip = -1;
        t_dip_transition = d_transtime;
    }
    else if (t_dip == -1 && t_dip_transition > 0)
    {
        t_dip_transition -= 1/game_get_speed(gamespeed_fps);
        z = (t_dip_transition/d_transtime)*dip_depth;
    }
    else if (t_dip == -1 && t_dip_transition <=0)
    {
        z = 0;
        t_dip_transition = 0;
        t_dip = 0;
        vDipBack = false;
        sprite_db = noone;
        image_db = 0;
        x_db = surface_get_width(surface)/2;
        y_db = surface_get_width(surface)/2;
        alpha_db = 1;
    }
}

surface_reset_target();

if (vDipBack)
{
    if (x_db = -1)
        {var x_db_actual = x;}
    else
        {var x_db_actual = x_db;}
    if (y_db = -1)
        {var y_db_actual = y;}
    else
        {var y_db_actual = y_db;}
    draw_set_alpha(alpha_db);
    if (sprite_db != noone)
        {draw_sprite(sprite_db,image_db,x_db_actual,y_db_actual);}
    draw_set_alpha(1);
}
/*
d3d_start();
{
    d3d_set_hidden(false);
    d3d_set_projection_perspective(0,0,room_width,room_height,0);
    d3d_set_depth(z);
    d3d_transform_set_identity();
    d3d_transform_add_rotation_x(180);
    d3d_transform_add_translation(0,room_height,0);
    d3d_transform_add_scaling(1,1,-1);
    draw_surface_ext(surface,xx + surf_x-surfWidth/4, yy + surf_y-surfHeight/4,surf_xscale,surf_yscale,surf_rot,surf_col,surf_alpha);
    d3d_transform_set_identity();
    d3d_set_projection_ortho(0,0,room_width,room_height,0);
    d3d_set_depth(0);
}
d3d_end();
*/
draw_surface_ext(surface,xx + surf_x-surfWidth/4, yy + surf_y-surfHeight/4,surf_xscale,surf_yscale,surf_rot,surf_col,surf_alpha);