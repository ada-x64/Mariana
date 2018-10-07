///draw the terminal
//we want this code to be in the Draw GUI event so it goes over normal draw layers, and stays constant regardless of view position
//fps
if display_fps
{
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(5,5,string_hash_to_newline("fps="+string(fps) + "; fps_real=" + string(fps_real)));
}

//vars
var hh = display_get_gui_height();
var ww = display_get_gui_width();

//draw icon if dev mod enabled
if (global.dev_mode_enabled)
{draw_sprite(ico_console,0,0,0);}

//=====================================
//== D R A W  T H E  T E R M I N A L ==
//=====================================
#region draw terminal
if (is_open) {
#region main
//initialize text
draw_set_font(fnt_console);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

//vars
var sep = string_height(string_hash_to_newline("H")) + 2;
var in_height;
in_height = sep*floor( string_width(string_hash_to_newline(str_input))/(ww-string_width(string_hash_to_newline(">"))) );
var out_height;
out_height = sep + sep*floor( string_width(string_hash_to_newline(str_output))/(ww-string_width(string_hash_to_newline("~"))));

//Condense parameter list into a single string
//do this instead of getting input string so we can see what the code is interpreting, just in case it breaks
var str_pars = "";
if par_count > 0
{
    for (var i=0;i<par_count;i++)
    {
        if (i == 0) {str_pars += "(";}
        str_pars += parameter_arr[i];
        if (i == par_count-1)
            {str_pars += ")";}
        else if (i < par_count-1)
            {str_pars +=",";}
    }
}
else if par_count == 0 && error = "" {str_pars = "()";}

//Draw the background
gpu_set_blendmode(bm_subtract);
draw_rectangle_colour(0,0,ww,hh-in_height-sep,c_dkgray,c_dkgray,c_white,c_white,0);
gpu_set_blendmode(bm_normal);
#endregion main
//=================
//== OUTPUT TEXT ==
//=================
#region output
//Error height
var error_height;
error_height = sep + sep*(floor( string_width(string_hash_to_newline(error))/(ww-string_width(string_hash_to_newline("!"))))+string_count("#",error));
if (error_height > hh-in_height)
{
    var width = sprite_get_width(spr_console_arrow);
    var height = sprite_get_height(spr_console_arrow);
    draw_rectangle(ww-1,height,ww-width,hh-out_height-height-in_height,1);
    var bar_pos = (hh-out_height-in_height-2*height) - ((hh-out_height-in_height-4*height) * (error_pos/(error_height+1.25*hh)) )
    draw_rectangle(ww-1,bar_pos,ww-width,bar_pos+height,0);
    draw_sprite(spr_console_arrow,0,ww-width,0);
    draw_sprite(spr_console_arrow,1,ww-width,hh-out_height-height-in_height);
    if  (error_pos < error_height+1.25*hh)
    {
        if ((0<mouse_y && height>=mouse_y) && ((mouse_check_button(mb_left)) && (ww-width<mouse_x))) || mouse_wheel_up()
        {error_pos += sep;}
    }
    if (error_pos > 0)
    {
        if (((hh-out_height-height-in_height<mouse_y) && (mouse_y<hh-out_height-in_height)) && ((mouse_check_button(mb_left)) && (ww-width<mouse_x))) || mouse_wheel_down()
        {error_pos -= sep;}
    }
}
else {error_pos = 0;}

//Set some strings
//str_tilde
if (str_command = "")
    {str_tilde = "";}
else
    {str_tilde = "~";}
//error string
if (error = "")
    {error = " success!";}

//str_output
str_output = str_tilde+str_command + str_pars;

//DRAW THE OUTPUT/ERROR TEXT
draw_text_ext(0,hh-string_height(string_hash_to_newline(">"))-in_height-error_height-error_pos,string_hash_to_newline(str_output),sep,ww);
draw_text_ext(0,hh-sep-in_height+error_pos,string_hash_to_newline("!"+error),sep,ww)
#endregion output
//================
//== INPUT TEXT ==
//================
#region input
//black rectangle ensures readability
draw_set_alpha(1)
draw_rectangle_colour(0,hh,ww,hh-in_height-sep,c_black,c_black,c_black,c_black,0);


//str_cursor is the little bar when getting input
var str_cursor=" "; 
if (cursor_timer >= 1)
    {str_cursor = "|";}
cursor_timer += 1.5/fps;
if (cursor_timer > 2)
    {cursor_timer = 0;}

//str_in_display gets the input text, then inserts str_cursor where needed
var str_in_display = str_input;
str_in_display = string_insert(str_cursor,str_in_display,input_pos);

//suggested command drawn below actual text
var str_suggested_display = str_suggested;
str_suggested_display = string_insert(" ",str_suggested_display,input_pos);
draw_set_alpha(0.6);
draw_text_ext(string_width(string_hash_to_newline(">")),hh,string_hash_to_newline(str_suggested_display),sep,ww-string_width(string_hash_to_newline(">")));
draw_set_alpha(1.0);

//DRAW THE INPUT TEXT
draw_set_colour(c_black)
draw_rectangle(0,hh,ww,hh+in_height,0);
draw_set_colour(c_white)
draw_text_ext(0,hh-in_height,string_hash_to_newline(">"),sep,ww);
draw_text_ext(string_width(string_hash_to_newline(">")),hh,string_hash_to_newline(str_in_display),sep,ww-string_width(string_hash_to_newline(">")));
#endregion
#endregion
//==================
//== MOUSE CURSOR ==
//==================
#region draw cursor
if (global.unfocused) {exit;}

//str_coords shows where the mouse is in respect to the screen
var str_coords = "("+string(mouse_x)+","+string(mouse_y)+")"

//draws mouse at device position to ensure it isn't stuck by messing with the gui size
draw_sprite(spr_console_cursor,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));

//set the alignment of the text so that it is always readable
if (device_mouse_x_to_gui(0) < string_width(string_hash_to_newline(str_coords)))
    {draw_set_halign(fa_left);}
else {draw_set_halign(fa_right);}
if (device_mouse_y_to_gui(0) < string_height(string_hash_to_newline(str_coords)))
    {draw_set_valign(fa_top);}
else {draw_set_valign(fa_bottom);}
draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),string_hash_to_newline(str_coords));

//right click to select
if mouse_check_button_pressed(mb_right)
{
    if instance_exists(instance_position(mouse_x,mouse_y,all))
        {
        selected_instance = instance_position(mouse_x,mouse_y,all)
        }
    else {selected_instance = noone;}
}

//a string to indicate the selected instance
var str_selected_instance;
if (instance_exists(selected_instance))
    {
    str_selected_instance = "instance selected!";
    rot_selected ++;
    draw_sprite_ext(spr_console_selected,0,selected_instance.x,selected_instance.y,1,1,rot_selected,c_white,0.5);
    draw_text(selected_instance.x,selected_instance.y-4,string_hash_to_newline(object_get_name(selected_instance.object_index)));
    }
else {str_selected_instance = "";}

//draw the coord text and the name of the selected instance
draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)+string_height(string_hash_to_newline(str_coords)),string_hash_to_newline(str_selected_instance));
}
#endregion