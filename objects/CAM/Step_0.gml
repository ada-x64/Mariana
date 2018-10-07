///zoom
if (zoom)
{
    t1_zoom = round(z_d1);
    t2_zoom = round(z_d2);
    vZoom = true;
    zoom = false;
}
if (vZoom)
{
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (z_focus.x - z_focus.xprevious) )
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (z_focus.y - z_focus.yprevious) )
    /*
    if view_xview < 0 {view_xview = 0}
    if view_xview > room_width-view_wview {view_xview = room_width - view_wview}
    if view_yview < 0 {view_yview = 0}
    if view_yview > room_height-view_hview {view_yview = room_height - view_hview}
    */
}
if (t1_zoom > 0)
{
    t1_zoom --;
    zI = cam_get_I(z_d1,z_i,t1_zoom,z_type1);
    __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) - (zI) );
    __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) - (zI) );
}
else if (t2_zoom > 0)
{
    t2_zoom --;
    zI = cam_get_I(z_d2,z_i,t2_zoom,z_type2);
    __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) + (zI) );
    __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) + (zI) );
}
else
{
    vZoom = false;
    z_d1 = 0;
    z_d2 = 0;
    z_i = 0;
    zI = 0;
    __view_set( e__VW.Object, 0, cam_focus );
}

/* */
///shake
if (shake)
{
    t_shake = round(d_shake);
    shake = false;
    vShake = true;
}
if (t_shake > 0)
{
    t_shake --;
    shakeI = cam_get_I(d_shake,i_shake,t_shake,shakeType);
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (irandom_range(-shakeI,shakeI) ));
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (irandom_range(-shakeI,shakeI) ));
}
else
{
    vShake = false;
    d_shake = 0;
    i_shake = 0;
    shakeI = 0;
}

/* */
///position and refocus

//position
x=0;
y=0;
__view_set( e__VW.HBorder, 0, __view_get( e__VW.WView, 0 )/2 );
__view_set( e__VW.VBorder, 0, __view_get( e__VW.HView, 0 )/2 );

if (!vZoom)
{
    //refocus
    if (__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2 != round(cam_focus.x) )
    {__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (sign(__view_get( e__VW.XView, 0) ) ));}
    if (__view_get( e__VW.YView, 0 ) != round(cam_focus.y - __view_get( e__VW.HView, 0 )/2))
    {__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (sign(__view_get( e__VW.YView, 0) ) ));}
    //reset zoom
    if (frac(__view_get( e__VW.WView, 0 )) != 0)
    {
        __view_set( e__VW.WView, 0, round(__view_get( e__VW.WView, 0 ) ));
    } 
    if (__view_get( e__VW.WView, 0 ) > round(INITIALIZER.ideal_width) )
    {
        __view_set_pp( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) - 1 );
    }
    else if (__view_get( e__VW.WView, 0 ) < round( INITIALIZER.ideal_width) )
    {
        __view_set_pp( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) + 1 );
    }
    
    if (frac(__view_get( e__VW.HView, 0 )) != 0)
    {
        __view_set( e__VW.HView, 0, round(__view_get( e__VW.HView, 0 ) ));
    } 
    if (__view_get( e__VW.HView, 0 ) > round(INITIALIZER.ideal_height) )
    {
        __view_set_pp( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) - 1 );
    }
    else if (__view_get( e__VW.HView, 0 ) < round(INITIALIZER.ideal_height) )
    {
        __view_set_pp( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) + 1 );
    }
}

/* */
/*  */
