if instance_number(object_index) > 1 {instance_destroy(self);}
script_execute(console_read_file,0,0,0,0,0);
///init

//vars
    //bools
    is_open = false;
    global.dev_mode_enabled = false;
    global.dev_show_masks = false;
	display_fps = false;
    
    //strings
    error = "";
    str_input = "";
    str_output = "";
    str_command = "";
    str_suggested = "";
    for (var i=0;i<16;i++)
        {parameter_arr[i] = "";}
    for (var i=0;i<100;i++)
        {saved_input[i] = "";}
        
    //ints
    par_count = 0;
    cursor_timer = 0;
    input_pos = 1;
    saved_input_pos = 0;
    backspace_timer = 0;
    left_timer = 0;
    right_timer = 0;
    error_pos = 0;
    selected_instance = noone;
    rot_selected = 0;
	num_suggestion = 0;
    
global.show_enemy_hp = true;

