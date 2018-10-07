///stop if window unfocused
if (global.unfocused)
{timeline_speed = 0; exit;}
else if (is_open)
{timeline_speed = 0;}
else {timeline_speed = 1;}
if keyboard_check(vk_control) and keyboard_check_pressed(ord("F")) {display_fps = !display_fps;}
///get input
//in Step event
if (!global.dev_mode_enabled)
{
    is_open = false;
    if (keyboard_check(vk_tab) && keyboard_check(vk_f1))
    {
        global.dev_mode_enabled = true;
        if (error = "")
        {
            error = "Dev mode enabled! You can now access this console by pressing tab or f1.";
            error += "#Type \'help\' if you\'re new."
        }
        is_open = true;
        keyboard_string = "";
    }
    exit;
}

enter_pressed = false;

if (keyboard_check_pressed(vk_f1) || keyboard_check_pressed(vk_tab))
{
    if (is_open)
    {
        //reset_mouse_pos();
    }
    else {window_mouse_set(window_get_width()/2,window_get_height()/2);}
    is_open = !is_open;
    keyboard_string = "";
}

if (is_open)
{
    enter_pressed = console_get_input();
	if keyboard_check(vk_delete)
	{
		if selected_instance != noone
		{
			instance_destroy(selected_instance);
			error = "Selected instance deleted!"
			selected_instance = noone;
		}
		else str_command = "";
	}
}

//********************************* M A I N ***********************************
if (enter_pressed)
{
    //reset variables
    //strings
    for (var i=0;i<16;i++)
        {parameter_arr[i] = "";}
    error = "";
    str_command = "";
    keyboard_string = "";
    //ints
    par_count = 0;
    in_length = string_length(str_input);
    
    //SPECIAL FUNCTIONS *******************************************************
        //quit
    if (str_input == "quit")
    {
        game_end();
    }
        //clear
    else if (str_input == "clear")
    {
        for (var i=0;i<99;i++)
        {
            saved_input[i] = "";
            error = "Input cache cleared!"
        }
    }
        //show cache
    else if (str_input == "cache")
    {
        for (var i=0;i<99;i++)
        {
            if (saved_input[i] == "") {break;}
            else {error += string(i) + ": " + string(saved_input[i]) + "# ";}
        }
    }
        //help
    else if (str_input == "help")
    {
        error = "Welcome to dev mode! This console can be used to manipulate the game in real time."
        error += "#For a full list of performable functions, type \'help -f\'. To exit the program, type \'quit\'."
        error += "#If you need help setting up the console, check out the readme.txt!#"
    }
    else if (string_pos("help -",str_input) == 1)
    {
        error = console_help(str_input);
    }
    
    //NORMAL FUNCTIONS ********************************************************
    else
    {
        error = console_check_syntax(str_input);
        
        //do the thing
        if (error = "")
            {error = console_perform_action(str_command,parameter_arr,par_count);}
    }
    
    //RESET INPUT *************************************************************
    str_input = "";
    input_pos = 1;
}

/* */
/*  */
