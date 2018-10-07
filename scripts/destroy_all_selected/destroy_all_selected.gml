///destroy_all_selected()
//destroys all instances of object selected.
var error = "";
var selected = DEV_TERMINAL.selected_instance;
if (instance_exists(selected))
{
    var obj = selected.object_index;
    if (instance_exists(obj))
    {
        var num = instance_number(obj)
        while (instance_exists(obj))
        {
            inst = instance_find(obj,0);
            with (inst) {instance_destroy();}
        }
        error = string(num)+" instances destroyed";
    }
}
else
{error = "no instance selected!";}

return(error);
