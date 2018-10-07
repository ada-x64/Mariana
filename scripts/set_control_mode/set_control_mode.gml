///set_control_mode(mode)

if (argument0 = "keyboard" || argument0 = "mouse" || argument0 = "gamepad")
{
    with (objM)
        {control_mode = argument0;}
    return("");
}
else {return("mode must be \"keyboard\", \"mouse\", or \"gamepad\"")}
