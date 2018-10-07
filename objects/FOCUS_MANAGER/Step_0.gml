///mouse position


//vars
var bsize = INITIALIZER.zoom * 1;                       //border size (real)
if (INITIALIZER.zoom == INITIALIZER.zoommax+1)
    {bsize = 0;}
var hmax = window_get_x()+window_get_width()-bsize;     //horizontal max (real)
var vmax = window_get_y()+window_get_height()-bsize;    //vertical max (real)
var hmin = window_get_x()+bsize;                        //horizontal min (real)
var vmin = window_get_y()+bsize;                        //vertical min (real)
var mx = display_mouse_get_x();                         //mouse x (real)
var my = display_mouse_get_y();                         //mouse y (real)
var mouse_in_boundry = true;                            //mouse in boundry (bool)
if (display_mouse_get_x() > hmax + bsize) || (display_mouse_get_x() < hmin-bsize)
    {mouse_in_boundry = false;}
if (display_mouse_get_y() > vmax + bsize) || (display_mouse_get_y() < vmin-bsize)
    {mouse_in_boundry = false;}

//set focus *******************************************************************
if (!window_has_focus()) || (DEV_TERMINAL.is_open && !mouse_in_boundry)
    {global.unfocused = true;}
if (global.unfocused == true)
{
    if mouse_check_button(mb_any)
    {
        global.unfocused = false;
        reset_mouse_pos();
    }
}

///lock mouse in window ********************************************************
if (!global.unfocused && window_has_focus())
{
    //horizontal
    if (mx >= hmax)
        {display_mouse_set(hmax,my); mx = hmax;}
    else if (mx <= hmin)
        {display_mouse_set(hmin,my); mx = hmin;}
        
    //vertical
    if (my >= vmax)
        {display_mouse_set(mx,vmax);}
    else if (my <= vmin)
        {display_mouse_set(mx,vmin);}
}

