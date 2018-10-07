///position
x = room_width/2;
y = room_height/2;
#region curve and rot
//clamp curve
if (! instance_exists(LEVEL_CURVE_EDITOR))
{
    if (CURVE <0) {CURVE = 0;}
    else if (CURVE>1) {CURVE = 1;}
}
//ensure 0<=ROT<360 -- angle redundancy, just for the sake of cleanliness.
if (! instance_exists(LEVEL_ROT_EDITOR))
{
    while (ROT >= 360) {ROT -= 360;}
    while (ROT < 0) {ROT += 360;}
}
var N = 1 - CURVE;
var R = display_get_gui_height()/2;
var W = R * (7*N + 1);
#endregion 
#region set global vars
global.bg_ellipse_width  = W;
global.bg_ellipse_height = R;
global.bg_rotation = ROT;
global.bg_curve = CURVE;
#endregion globals
#region ellipse coords
//points on the ellipse
var a = global.bg_ellipse_width; //major axis
var b = global.bg_ellipse_height; //minor axis

var lx1, lx2, ly1, ly2;

for (var i=0; i<360/15; i++)
{
    xx[i] = 0;
    yy[i] = 0;
}
for (var i = 0; i <= 360/15; i ++)
{
    if (i < 90/15 || i >= 270/15)
    {
        //set point
        xx[i] = (a*b)/sqrt(sqr(b) + sqr(a)*sqr(dtan(i)) );
        yy[i] = xx[i]*dtan(i);
        //rotate point
        var xnew = xx[i]*dcos(-ROT) - yy[i]*dsin(-ROT);
        var ynew = xx[i]*dsin(-ROT) + yy[i]*dcos(-ROT);
        //translate point
        xx[i] = xnew + __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
        yy[i] = ynew + __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;
    }
    else
    {
        //set point
        xx[i] = -(a*b)/sqrt(sqr(b) + sqr(a)*sqr(dtan(i)) );
        yy[i] = xx[i]*dtan(i);
        //rotate point
        var xnew = xx[i]*dcos(-ROT) - yy[i]*dsin(-ROT);
        var ynew = xx[i]*dsin(-ROT) + yy[i]*dcos(-ROT);
        //translate point
        xx[i] = xnew + __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
        yy[i] = ynew + __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;
    }
    if (i == 0)
        {lx1 = xx; ly1 = yy;}
    else if (i == 180/15)
        {lx2 = xx; ly2 = yy;}
}

global.bg_ellipse_x = xx;
global.bg_ellipse_y = yy;
#endregion elipse coords
