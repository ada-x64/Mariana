///move_selected_to_cursor
var error = "";

if instance_exists(DEV_TERMINAL.selected_instance)
{
    var inst = DEV_TERMINAL.selected_instance
    with inst {x = mouse_x; y = mouse_y;}
}
else {error = "no instance selected";}

return(error);
