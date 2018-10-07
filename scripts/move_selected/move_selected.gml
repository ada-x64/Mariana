///move_selected(x,y)
var error = "";
var xx = argument0;
var yy = argument1;

if instance_exists(DEV_TERMINAL.selected_instance)
{
    var inst = DEV_TERMINAL.selected_instance
    with inst {x = xx; y = yy;}
}
else {error = "no instance selected";}

return(error);
