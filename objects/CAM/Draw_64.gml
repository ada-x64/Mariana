
///draw bars
/*
if !(surface_exists(surf_border))
    {surf_border = surface_create(room_width*sqrt(2),room_width*sqrt(2));}
surface_set_target(surf_border)
{
    //set colour
    var col1 = c_ltgray // make_colour_rgb(255-38,255-83,255-128); //blue
    var col2 = make_colour_rgb(255-255,255-221,255-51); //yellow
    var col = merge_colour(col1,col2,1-global.speed_manip);
    draw_set_colour(col);
    
    //set curvature
    var curve = global.bg_curve
    var N = 1 - curve;
    var R = display_get_gui_height()/2;
    var W = R * (7*N + 1);
    var xx = W + surface_get_width(surf_border)/2;
    var x1, x2;
    x1 = xx;
    x2 = surface_get_width(surf_border) - xx;
    var y1 = (surface_get_width(surf_border)-display_get_gui_height())/2;
    var y2 = y1+display_get_gui_height();
    
    //draw things
    draw_clear(col);
    draw_set_circle_precision(24);
    draw_set_colour(c_black);
    draw_ellipse(x1,y1,x2,y2,0);
}
surface_reset_target()

//draw ellipse / focus surface
/*
gpu_set_blendmode(bm_subtract);

var rot = global.bg_rotation;
var LL = surface_get_width(surf_border)/2 ;
var hh = display_get_gui_width()/2 ;
var kk = display_get_gui_height()/2 ;
var xx = hh - LL*dcos(rot) - LL*dsin(rot);
var yy = kk + LL*dsin(rot) - LL*dcos(rot);

draw_surface_ext(surf_border,xx,yy,1,1,rot,c_white,1);

gpu_set_blendmode(bm_normal)
*/


//solid bars
/**
depth = -50;
draw_set_alpha(0.25)
draw_set_colour(c_dkgray);
draw_rectangle(0,                      0, (INITIALIZER.ideal_width/2)-(4/6)*INITIALIZER.ideal_height, display_get_gui_height(),0)
draw_rectangle(display_get_gui_width(),0, (INITIALIZER.ideal_width/2)+(4/6)*INITIALIZER.ideal_height, display_get_gui_height(),0)
draw_set_alpha(1);
/**/

//gradient bars
/*
draw_set_colour(c_white);
gpu_set_blendmode(bm_subtract);
draw_rectangle_colour(0                      ,0,(INITIALIZER.ideal_width/2)-(4/6)*INITIALIZER.ideal_height,display_get_gui_height(),c_white,c_black,c_black,c_white,0)
draw_rectangle_colour(display_get_gui_width(),0,(INITIALIZER.ideal_width/2)+(4/6)*INITIALIZER.ideal_height,display_get_gui_height(),c_black,c_white,c_white,c_black,0)
gpu_set_blendmode(bm_normal)
*/
//window border
draw_set_colour(c_black);
draw_rectangle(-1,-1,display_get_gui_width()-1,display_get_gui_height()-1,1);

/* debug
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),true);
draw_rectangle(0+2,0+2,display_get_gui_width()-2,display_get_gui_height()-2,true);
draw_set_font(fnt_debug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(0+4,0+8,"(wview,hview)=("+string(display_get_gui_width())+","+string(display_get_gui_height())+")")
draw_text(0+4,0+16,"(xview,yview)=("+string(0)+","+string(0)+")")
draw_text(0+4,0+24,"(xport,yport)=("+string(view_xport)+","+string(view_yport)+")")
draw_text(0+4,0+36,"(wport,hport)=("+string(view_wport)+","+string(view_hport)+")")


/* */
///debug text
/*
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_font(fnt_debug);
draw_set_halign(fa_right);
draw_text(display_get_gui_width(),0,"view_xview="+string(view_xview));
draw_text(display_get_gui_width(),8,"view_yview="+string(view_yview));
draw_text(display_get_gui_width(),16,"view_wview="+string(view_wview));
draw_text(display_get_gui_width(),24,"view_hview="+string(view_hview));
draw_text(display_get_gui_width(),32,"gui_width="+string(display_get_gui_width()));
draw_text(display_get_gui_width(),40,"gui_height="+string(display_get_gui_height()));
//*
draw_text(display_get_gui_width(),32,"zI="+string(zI));
draw_text(display_get_gui_width(),40,"t1="+string(t1_zoom));
draw_text(display_get_gui_width(),48,"t2="+string(t2_zoom));

//*/

/* */
/*  */
