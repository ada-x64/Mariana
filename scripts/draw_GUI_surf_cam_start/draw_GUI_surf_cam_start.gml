///draw_GUI_surf_cam_start()
d3d_light_define_ambient(c_white);
draw_set_colour(c_white);
d3d_set_fog(false,c_purple,500,20000);

if !surface_exists(surface)
    {surface = surface_create(64,64);}
surface_set_target(surface);

var surfWidth = surface_get_width(surface);
var surfHeight = surface_get_width(surface);
draw_clear_alpha(c_white,0);

//set position
surf_x = x + (1-surf_xscale)*(surfWidth/2) - (surfWidth*surf_xscale)/4
surf_y = y + (1-surf_yscale)*(surfHeight/2) - (surfHeight*surf_yscale)/4

//shake ******************************************************************
if (surfShake)
{
    t_shake = d_shake;
    vShake = true;
    surfShake = false;
}

if (t_shake > 0)
    {
    t_shake -= 1;
    shakeI = cam_get_I(d_shake,i_shake,t_shake,shakeType)
    surf_x += irandom_range(-shakeI,shakeI)
    surf_y += irandom_range(-shakeI,shakeI)
    }
else
    {
    t_shake = 0;
    vShake = 0;
    i_shake = 0;
    d_shake = 0;
    shakeType = camtype.constant;
    }

//zoom *******************************************************************
if (surfZoom && t1_zoom = 0 && t2_zoom = 0)
{
    t1_zoom = round(z_d1);
    t_zoom_pause = round(z_dp);
    t2_zoom = round(z_d2);
    vZoom = true;
    surfZoom = false;
}
if (t1_zoom > 0)
{
    t1_zoom -= 1;
    zI = cam_get_I(z_d1,z_i,t1_zoom,z_type1);
    surf_xscale = ((surf_xscale*surfWidth)+zI)/surfWidth;
    surf_yscale = ((surf_yscale*surfHeight)+zI)/surfHeight;
}
else if (t_zoom_pause > 0)
{
    t_zoom_pause --;
}
else if (t2_zoom > 0)
{
    t2_zoom -= 1;
    zI = cam_get_I(z_d2,z_i,t2_zoom,z_type2);
    surf_xscale = ((surf_xscale*surfWidth)-zI)/surfWidth;
    surf_yscale = ((surf_yscale*surfHeight)-zI)/surfHeight;
}
else
{
    vZoom = false;
    z_d1 = 0;
    z_d2 = 0;
    z_i = 0;
    zI = 0;
}
