///destroy_at_cursor()
//destroys object selected.
var error = "";
if instance_exists(instance_position(mouse_x,mouse_y,all))
{
    var inst = instance_position(mouse_x,mouse_y,all);
    error = "instance "+object_get_name(inst.object_index)+" destroyed."
    with inst {instance_destroy();}
}
else {error = "no instance at cursor";}

return(error);
