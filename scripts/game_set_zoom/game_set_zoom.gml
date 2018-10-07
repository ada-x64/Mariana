///game_set_zoom(zoom)

var error = "";
var zoom = floor(argument0);
if (zoom > INITIALIZER.zoommax + 1)
{
    error = "zoom too large, setting to zoommax = "+string(INITIALIZER.zoommax + 1);
    zoom = INITIALIZER.zoommax + 1;
}
if (zoom <= 0)
{
    error = "zoom too small, setting to 1";
    zoom = 1;
}

INITIALIZER.zoom = zoom;

with (INITIALIZER)
{
    zoom_timer = 2;
    if zoom = zoommax+1 {window_set_fullscreen(true);}
    else {window_set_fullscreen(false);}
    if zoom > zoommax+1 {zoom = minzoom;}
    scr_resize_window(ideal_width,ideal_height,zoom);
}

reset_mouse_pos();

return(error);
