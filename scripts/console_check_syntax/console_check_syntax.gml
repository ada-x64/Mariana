///console_check_syntax(str_input)
str_input = argument0;
error = "";
//1. check input for "("
var i=1;
while(true)
{
    var char = string_char_at(str_input,i);
    if (char == "(")
    {
        i++;
        break;
    }
    else
    {
        if (char != " ") //ignore white space
            {str_command += char;}
        i++;
        if (i>in_length) {error = "syntax error: no \'(\'"; break;}
    }
}
var j = 0;
if (error == "") {
//2. check input for ")" or ","
while(true)
{
    var is_str = false;
    while (true)
    {
        var char = string_char_at(str_input,i);
        if (char == "\'" || char == "\"")
        {
            is_str = true;
        }
        if (char == ",") //if found a comma, move ahead one and break -- do not add it to the parameter!
        {
            i++
            break;
        }
        else if (char == ")") //if found a closed parenthesis, break -- do not move forward! outer loop needs the ")" to function properly
        {
            break;
        }
        else //if neither, add the char to the parameter and loop again
        {
            if (char != " " || is_str) //ignore white space unless interprets it as a string
                {parameter_arr[j] += char;}
            i++;
            if (i > in_length) {error = "syntax error"; break;}
        }
    }

    var char = string_char_at(str_input,i);
    if (char == ")")
    {
        break;
    }
    else if (j < 15)
    {
        j++;
    }
    else if (j >= 15)
    {
        error = "syntax error: unclosed function"; break;
    }
}
//set number of parameters
if (parameter_arr[0] = "")
    {par_count = 0;}
else
    {par_count = j+1;}
}

return(error);
