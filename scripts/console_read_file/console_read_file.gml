///dev_read_command_file()

show_debug_message("=== dev_read_command_file() ===");

//init variables **************************************************************
    //arrays
var file_function;
var function_description;
var parameter;
    //file
if file_exists("dev_commands.txt")
    {var file_location = working_directory + "dev_commands.txt";}
else {show_error("dev_commands.txt not found!",0)}
    //function and description arrays
for (var i=0;i<100;i++)
{
    file_function[i] = "";
    function_description[i] = "";
    for (var j=0;j<16;j++)
    {
        parameter_name[i,j] = "";
    }
}
var num_of_funcs=-1;

//read in the file ************************************************************
file = file_text_open_read(file_location);
while (num_of_funcs < 100)
{
    var str = file_text_readln(file);
    //pass description, ignore comments
    if (string_pos("/*/",str) == 1 && num_of_funcs >= 0)
        {function_description[num_of_funcs] = string_replace(str,"/*/","");}
    else if (string_count("//",str) == 0) //ignore comments, get the functions
    {
        num_of_funcs++; //put this first so num_of_funcs is non-negative
        file_function[num_of_funcs] = str;
    }
    if (file_text_eof(file))
        {break;}
}
file_text_close(file);
show_debug_message("dev_commands.txt read complete!")
show_debug_message("number of functions = "+string(num_of_funcs));

//make the command and parameter arrays ***************************************
for (var i=0;i<num_of_funcs+1;i++)
{
    //init variables
    var str = file_function[i];
    //show_debug_message("str="+string(str));
    command[i] = "";
    for (var k=0;k<19;k++) //k<19 --> number + 16 parameters + name + description
        {parameter[i,k] = "";}
    var pos = 1;
    
    //get command string
    while (true)
    {
        var char = string_char_at(str,pos);

        if (char == "(")
            {pos++; break;}
        else if (char != " ")
            {command[i] += char; pos++;}
        else if (pos <= string_length(str)) {pos++;}
        else {show_error("in dev_read_file in command loop: pos too long!",1);}
    }
    //show_debug_message("command for i="+string(i)+" complete!")
    
    //get parameter array
    var j = 0;
    var is_copying_to_parameter_name = false;
    while (true)
    {
        var char = string_char_at(str,pos);
        if (char == "/")
            {is_copying_to_parameter_name = true; pos++;}
        else if (char == ",")
            {pos++; j++; is_copying_to_parameter_name = false;}
        else if (char == ")")
            {break;}
        else if (pos <= string_length(str))
            {
            if (is_copying_to_parameter_name)
                {parameter_name[i,j] += char;}
            else if (char != " ")
                {parameter[i,j] += char;}
            pos++;
            }
        else {show_error("in dev_read_file in parameter loop: pos too long!",1);}
    }
    parameter[i,0] = real(string_digits(parameter[i,0])); //real that holds parameter count
    //show_debug_message("parameter["+string(i)+",0]="+string(parameter[i,0]))
    parameter[i,17] = command[i]; //string that holds command name
    //show_debug_message("parameter["+string(i)+",17]="+string(parameter[i,17]))
    parameter[i,18] = function_description[i]; //string that holds description
    //show_debug_message("parameter["+string(i)+",18]="+string(parameter[i,18]))
    
    //show_debug_message("parameters for i="+string(i)+" complete!")
}

//make the global func array **************************************************
global.dev_func_count = num_of_funcs;
for (var i=0;i<global.dev_func_count+1;i++)
{
    for (var j=0; j<19;j++)
    {
        global.dev_func_arr[i,j] = parameter[i,j];
        if (global.dev_func_arr[i,j] != "")
            //show_debug_message("dev_func_arr["+string(i)+","+string(j)+"]="+string(global.dev_func_arr[i,j]));
        if (j<16)
        {
            global.dev_func_pname[i,j] = parameter_name[i,j];
            //if (global.dev_func_pname[i,j] != "")
                //show_debug_message("dev_func_pname["+string(i)+","+string(j)+"]="+string(global.dev_func_pname[i,j]));
        }
    }
}

//reset arrays ****************************************************************
file_function = 0;
function_description = 0;
parameter = 0;

show_debug_message("=== END OF dev_read_command_file() ===");
