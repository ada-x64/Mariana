///console_get_input()
enter_pressed = false;

//CHECK FOR SUGGESTED FUNCTION *******************************************
if (string_length(str_input) >= 1)
{
	if keyboard_check_pressed(vk_down) and keyboard_check(vk_shift)
		{num_suggestion ++;}
	else if keyboard_check_pressed(vk_up) and keyboard_check(vk_shift)
		{num_suggestion --;}
	if num_suggestion < 0 {num_suggestion = 0;}
    var command_found = false;
	var ival = 0;
	for (var j = 0; j < num_suggestion+1; j++)
	{
	    for (var i = ival; i < global.dev_func_count+1; i++)
	    {
	        if (string_pos(str_input,global.dev_func_arr[i,17]) = 1)
	            {command_found = true; command = global.dev_func_arr[i,17]; ival = i+1; break;}
			if i = global.dev_func_count {ival = 0; break;}
	    }
	}
    if (command_found)
        {str_suggested = command;}
    else {str_suggested = "";}
}
else {str_suggested = "";}

// *** *** GET INPUT *** *** *********************************************
if keyboard_check(vk_anykey)
    {cursor_timer = 1;}

//ENTER *******************************************************************
if keyboard_check_pressed(vk_enter)
{
    enter_pressed = true;
    saved_input[0] = str_input;
    for (var i=99; i>0; i--)
    {
        saved_input[i] = saved_input[i-1];
    }
    saved_input[0] = "";
    saved_input_pos = 0;
    error_pos = 0;
}
//UP **********************************************************************
else if keyboard_check_pressed(vk_up) and !keyboard_check(vk_shift)
{
    if (saved_input_pos != 99 && saved_input[saved_input_pos+1] != "")
    {
        saved_input[saved_input_pos] = str_input;
        saved_input_pos++;
        str_input = saved_input[saved_input_pos];
        if string_count(" <cache position",error) > 0
            {error = string_delete(error,string_pos(" <cache position",error),string_length(error));}
        error += " <cache position "+string(saved_input_pos)+">";
    }
    input_pos = string_length(str_input)+1;
}
//DOWN ********************************************************************
else if keyboard_check_pressed(vk_down) and !keyboard_check(vk_shift)
{
    if (saved_input_pos != 0)
    {
        saved_input[saved_input_pos] = str_input;
        saved_input_pos--;
        str_input = saved_input[saved_input_pos];
        if string_count(" <cache position",error) > 0
            {error = string_delete(error,string_pos(" <cache position",error),string_length(error));}
        error += " <cache position "+string(saved_input_pos)+">";
    }
    input_pos = string_length(str_input)+1;
}
//LEFT ********************************************************************
else if (keyboard_check_pressed(vk_left))
{
    if (input_pos != 1)
        input_pos--;
}
else if (keyboard_check(vk_left))
{
    left_timer ++;
    if (left_timer > fps/2)
    {
        if (input_pos != 1)
            {
            input_pos--;
            left_timer = (fps/2 - fps/16);
            }
    }
}
else if (keyboard_check_released(vk_left))
    {left_timer = 0;}
    
//RIGHT *******************************************************************
else if (keyboard_check_pressed(vk_right))
{
    if (str_suggested != "" && input_pos == string_length(str_input)+1)
        {
        str_input = str_suggested;
        str_suggested = "";
        input_pos = string_length(str_input)+1;
        }
    else if (input_pos <= string_length(str_input))
        input_pos++;
}
else if (keyboard_check(vk_right))
{
    right_timer ++;
    if (right_timer > fps/2)
    {
        if (input_pos <= string_length(str_input))
            {
            input_pos++;
            right_timer = (fps/2 - fps/16);
            }
    }
}
else if (keyboard_check_released(vk_right))
    {right_timer = 0;}
    
//BACKSPACE ***************************************************************
else if (keyboard_check_pressed(vk_backspace))
{
    if (input_pos !=1)
    {
        str_input = string_delete(str_input,input_pos-1,1);
        input_pos --;
    }
}
else if (keyboard_check(vk_backspace))
{
    backspace_timer ++;
    if (backspace_timer > fps/2)
    {
        if (input_pos !=1)
        {
            str_input = string_delete(str_input,input_pos-1,1);
            input_pos --;
            backspace_timer = (fps/2 - fps/16);
        }
    }
}
else if (keyboard_check_released(vk_backspace))
    {backspace_timer = 0;}
    
//ANYKEY ******************************************************************
else if keyboard_check_pressed(vk_anykey) && !(keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_alt))
{
    str_input = string_insert(keyboard_string,str_input,input_pos);
    input_pos += string_length(keyboard_string);
    keyboard_string = "";
}

return(enter_pressed)
