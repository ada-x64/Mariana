///determine os
if instance_number(object_index) > 1 {instance_destroy(self);}
switch (os_type)
    {
    case os_windows:
    case os_macosx:
    case os_linux: {/*if debug_mode {show_message("OS = "+string(os_type)); }*/ break;}
    default: {show_error("OS not supported!",1); break;}
    }

global.unfocused = false;
global.paused = false;

#region zoom, aspect ratio
///set variables
/*
//ideals
ideal_width = 720; //if less important, = 0
ideal_height = 0; //if less important, = 0
dpi = sqrt(display_get_dpi_x() * display_get_dpi_y());
//if debug_mode show_message("dpi = " + string(dpi));
minzoom = 1;
//if debug_mode show_message("minzoom = "+string(minzoom))
zoom = minzoom;
maxzoom = minzoom;

ideal_display_width = display_get_width(); //1440 //emulate Galaxy S6. otherwise = display_get_width();
ideal_display_height = display_get_height(); //2560 //emulate Galaxy S6. otherwise = display_get_height();
aspect_ratio_orig = ideal_display_width/ideal_display_height;

//catch oversize and rescale
if (ideal_display_width > (display_get_width() - 64))
    {
    var d = (display_get_width()-64)/ideal_display_width;
    //resize display
    ideal_display_width = floor(ideal_display_width * d);
    ideal_display_height = floor(ideal_display_height * d);
    //check minimums
    if ((ideal_display_width < ideal_width) && (ideal_width != 0))
        {
        var scale = ideal_width/ideal_display_width;
        ideal_display_width = ideal_width;
        ideal_display_height = round(ideal_display_height * scale);
        //if debug_mode show_message("Cannot scale to less than 1x; height will be offscreen!");
        }
    else if ((ideal_display_height < ideal_height) && (ideal_height !=0))
        {
        var scale = ideal_height/ideal_display_height;
        ideal_display_height = ideal_height;
        ideal_display_width = round(ideal_display_width * scale);
        //if debug_mode show_message("Cannot scale to less than 1x; width will be offscreen!");
        }
    //check odd
    if (ideal_display_width & 1)
        {ideal_display_width ++;}
    if (ideal_display_height & 1)
        {ideal_display_height ++;}
    //display message
    //if debug_mode show_message("sample width too wide; resizing to "+string(ideal_display_width)+"x"+string(ideal_display_height))
    }
    
if (ideal_display_height > (display_get_height() - 64))
    {
    //get ratio
    var d = (display_get_height()-64)/ideal_display_height;
    //resize display
    ideal_display_width = floor(ideal_display_width * d);
    ideal_display_height = floor(ideal_display_height * d);
    //check minimums
    if ((ideal_display_width < ideal_width) && (ideal_width != 0))
        {
        var scale = ideal_width/ideal_display_width;
        ideal_display_width = ideal_width;
        ideal_display_height = round(ideal_display_height * scale);
        //if debug_mode show_message("Cannot scale to less than 1x; height will be offscreen!");
        }
    else if ((ideal_display_height < ideal_height) && (ideal_height !=0))
        {
        var scale = ideal_height/ideal_display_height;
        ideal_display_height = ideal_height;
        ideal_display_width = round(ideal_display_width * scale);
        //if debug_mode show_message("Cannot scale to less than 1x; width will be offscreen!");
        }
    //check odd
    if (ideal_display_width & 1)
        {ideal_display_width ++;}
    if (ideal_display_height & 1)
        {ideal_display_height ++;}
    //display message
    //if debug_mode show_message("sample height too tall; resizing to "+string(ideal_display_width)+"x"+string(ideal_display_height))
    }

aspect_ratio = ideal_display_width/ideal_display_height;
math_set_epsilon(0.01);
if (aspect_ratio != aspect_ratio_orig)
    {
    //show_error("aspect ratio skewed! orig: "+string(aspect_ratio_orig)+" new: "+string(aspect_ratio),1);
    }
else
    {
    ideal_height = round(ideal_width/aspect_ratio); //if width is more important
    //ideal_width = round(ideal_height*aspect_ratio); //if height is more important
    }
math_set_epsilon(0);

//check for odd numbers
if (ideal_width & 1)
    {
    ideal_width ++;
    }
if (ideal_height & 1)
    {
    ideal_height ++;
    }
    */
//determine max zoom
ideal_width = 640;
ideal_height = 360;
dwidth = display_get_width();
dheight = display_get_height();
zoommax = min(floor(dwidth/ideal_width), floor(dheight/ideal_height));
/*
for (var i = 1; i*ideal_width <= ideal_display_width && i*ideal_height <= ideal_display_height; i ++)
    {
    zoommax = i;
    }*/
zoom = zoommax;
zoom_timer = 0;
minzoom = 1;
show_debug_message("widthmax = "+string(dwidth/ideal_width)+"# heightmax = "+string(dheight/ideal_height));
#endregion zoom
//if debug_mode show_message("zoommax = " +string(zoommax));
#region view
//enable views in every room;
for(var i=1; i<=room_last; i++)
{
  if(room_exists(i))
  {
    room_set_view(i,0,true,0,0,ideal_width,ideal_height,0,0,ideal_width,ideal_height,0,0,0,0,cam_focus);
    room_set_view_enabled(i,true);
    room_set_width(i,ideal_width);
    room_set_height(i,ideal_height);
  }
}
#endregion view
ideal_width_original = ideal_width;
ideal_height_original = ideal_height;

//resize stuff
//scr_resize_window(ideal_width,ideal_height,zoom);
scr_resize_window(640,360,2);

///create managers, cam, terminal
show_debug_message("=== INITIALIZER CREATE SEQUENCE ===");
global.background_layer = layer_create(100, "background layer");
global.player_layer = layer_create(0,"player layer");
global.enemy_layer = layer_create(10,"enemy layer");
global.terminal_layer = layer_create(-100,"terminal layer");
global.bullet_layer = layer_create(20,"bullet layer");
var i=0;
while (object_exists(i))
{
    //show_debug_message(string(i)+": ")
    if object_get_persistent(i) and i != INITIALIZER //(string_count("MANAGER",object_get_name(i)) > 0)
    {
        instance_create_layer(x,y,global.background_layer,i)
        show_debug_message("object "+object_get_name(i)+" created!");
    }
    i++;
}
instance_create_layer(x,y,global.background_layer,CAM);
instance_create_layer(x,y,global.background_layer,C);
instance_create_layer(x,y,global.background_layer,DEV_TERMINAL);

/*
i=0;
while (script_exists(i))
{
    //show_debug_message(string(i)+": ")
    if (string_count("ENUM_",script_get_name(i)) > 0)
    {
        script_execute(i)
        show_debug_message("script "+script_get_name(i)+" executed!");
    }
    else
    {
        //show_debug_message("script "+script_get_name(i)+" skipped");
    }
    i++;
}*/
//global variables
global.aspect_ratio = ideal_width/ideal_height ;
global.level = 0;
global.gamepad_supported = gamepad_is_supported();
scr_init_paths();
game_set_speed(60,gamespeed_fps);

//don't stay in tiny room
window_mouse_set(window_get_width()/2,window_get_height()/2)
room_goto_next();
show_debug_message("=== END INITIALIZER CREATE SEQUENCE ===");

