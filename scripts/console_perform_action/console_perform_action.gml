///console_perform_action(command,parameter arr,arr length)
error = "";

var str_command = argument0;
var parameter_arr = argument1;
var parameter_arr_length = argument2;
var error = "";
command = "";
for (var i=0; i<16;i++)
    {p[i] = "";}

//1. function lookup (WORKS)
var command_found = false;
for (var i = 0; i < global.dev_func_count+1; i++)
{
    if (str_command == global.dev_func_arr[i,17])
        {command_found = true; command = i; break;}
}
if (command_found == false)
    {return("command not found");}

//2. check parameter array length (WORKS)
if !(parameter_arr_length == global.dev_func_arr[command,0])
    {return("incorrect number of parameters");}

//3. check parameter types (WORKS)
if (parameter_arr_length > 0)
{
    for (var i=0;i<parameter_arr_length;i++)
    {
        //1. number (WORKS)
        if (global.dev_func_arr[command,i+1] == "number")
        {
            var num = real(parameter_arr[i]);
            //if (string_length(string(num)) == string_length(parameter_arr[i]))
                {p[i] = real(num);}
            //else
                //{return("incorrect type at parameter "+string(i)+": expects number#input: "+string(num));}
        }
        //2. string (WORKS)
        else if (global.dev_func_arr[command,i+1] == "string")
        {
            var dbl_quote = (string_char_at(parameter_arr[i],1) == "\"" && string_char_at(parameter_arr[i], string_length(parameter_arr[i]) ) == "\"")
            var single_quote = (string_char_at(parameter_arr[i],1) == "\'" && string_char_at(parameter_arr[i], string_length(parameter_arr[i]) ) == "\'")
            if (dbl_quote || single_quote)
                {p[i] = string_copy(parameter_arr[i],2,string_length(parameter_arr[i])-2);}
            else
                {p[i] = string_copy(parameter_arr[i],1,string_length(parameter_arr[i]));}
        }
        //3. bool (WORKS)
        else if (global.dev_func_arr[command,i+1] == "bool")
        {
            if (parameter_arr[i] == "true" || parameter_arr[i] == "1" || parameter_arr[i] == "t")
                {p[i] = true;}
            else if (parameter_arr[i] == "false" || parameter_arr[i] == "0" || parameter_arr[i] == "f")
                {p[i] = false;}
            else
                {return("incorrect type at parameter "+string(i)+": expects bool");}
        }
        //4. any (WORKS)
        else if (global.dev_func_arr[command,i+1] == "any")
        {
            p[i] = parameter_arr[i];
        }
        //5. catch error
        else
        {
            return("!!unknown/coding error");
            break;
        }
    }
}

//4. perform the script!
if (error = "")
{
    var script;
    var func_exists = false;
    var j = 0;
    
    while (script_exists(j))
    {
        script = script_get_name(j);
        //show_debug_message("script at index "+string(j)+"="+string(script));
        if (str_command == script)
            {func_exists = true; break;}
        j++;
    }
    
    if (!func_exists)
        {return("script does not exist");}
    
    switch (parameter_arr_length)
    {
    case 0:
        {error = script_execute(j);
        break;}
    case 1:
        {error = script_execute(j,p[0]);
        break;}
    case 2:
        {error = script_execute(j,p[0],p[1]);
        break;}
    case 3:
        {error = script_execute(j,p[0],p[1],p[2]);
        break;}
    case 4:
        {error = script_execute(j,p[0],p[1],p[2],p[3]);
        break;}
    case 5:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4]);
        break;}
    case 6:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5]);
        break;}
    case 7:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6]);
        break;}
    case 8:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7]);
        break;}
    case 9:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
        break;}
    case 10:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9]);
        break;}
    case 11:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10]);
        break;}
    case 12:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11]);
        break;}
    case 13:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12]);
        break;}
    case 14:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
        break;}
    case 15:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13],p[14]);
        break;}
    case 16:
        {error = script_execute(j,p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13],p[14],p[15]);
        break;}
    }
}//*/

return(error);
