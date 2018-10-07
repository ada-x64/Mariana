///destroy_selected()
//destroys object selected.
var error = "";
if instance_exists(DEV_TERMINAL.selected_instance)
{
    var inst = DEV_TERMINAL.selected_instance
    error = "instance "+object_get_name(inst.object_index)+" destroyed."
    with inst {instance_destroy();}
}
else {error = "no instance selected";}

return(error);
