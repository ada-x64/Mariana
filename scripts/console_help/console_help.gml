///console_help(str_input)
str_input = argument0;

if string_pos("quit",str_input) == 7
{
    error += "#quit";
    error += "#   exits the game.";
}
else if string_pos("clear",str_input) == 7
{
    error += "#clear";
    error += "#   clears the input cache.#";
}
else if string_pos("help",str_input) == 7
{
    error += "help";
    error += "#   shows the help menu. use help -f to see the function list. use help -\'FUNC\' to see a function\'s details.";
}
else if string_pos("f",str_input) == 7
{
    error += "@help";
    error += "#   shows the help menu. use help -f to see this list. use help -\'FUNC\' to see a function\'s details.";
    error += "#@quit";
    error += "#   exits the game.";
    error += "#@clear";
    error += "#   clears the input cache.#";
    for (var i=0;i<global.dev_func_count+1;i++)
    {
        var func_pcount = global.dev_func_arr[i,0];
        var func_name = global.dev_func_arr[i,17];
        var func_description = global.dev_func_arr[i,18];
        error += "@"+func_name;
        if func_pcount != 0
        {
            error += "(";
            for (var j=1; j<func_pcount+1; j++)
            {
                if global.dev_func_pname[i,j] == ""
                    {error += global.dev_func_arr[i,j];} //pass the parameter type
                else {error += global.dev_func_pname[i,j];}
                if (j < func_pcount)
                    {error += ", ";}
                else {error += ")#";}
            }
        }
        else {error += "()#";}
        
        if func_description != ""
            {error += "   "+func_description;}
    }
}
else //look up a function
{
    var str_func = string_copy(str_input,7,string_length(str_input));
    var command_found = false;
    var command = -1;
    for (var i = 0; i < global.dev_func_count+1; i++)
    {
        if (str_func == global.dev_func_arr[i,17])
            {command_found = true; command = i; break;}
    }
    if (command_found == false)
        {error = "no command found";}
    else
    {
        var func_pcount = global.dev_func_arr[command,0];
        var func_name = global.dev_func_arr[command,17];
        var func_description = global.dev_func_arr[command,18];
        error += func_name;
        if func_pcount != 0
        {
            error += "(";
            for (var j=1; j<func_pcount+1; j++)
            {
                if global.dev_func_pname[command,j] == ""
                    {error += ("["+ global.dev_func_arr[command,j] +"]");} //pass the parameter type
                else {error += (global.dev_func_pname[command,j] + " [" + global.dev_func_arr[command,j] + "]");} //NAME / TYPE
                if (j < func_pcount)
                    {error += ", ";}
                else {error += ")#";}
            }
        }
        else {error += "(no parameters)#";}
        
        if func_description != ""
            {error += "   "+func_description;}
        else {error += "   no description given";}
    }
}

return(error);
