///destroy_all(object)
//destroys all instance of object.
var error = "";
var selected = asset_get_index(argument0);
if instance_exists(selected)
{
    var obj = (selected.object_index);
    var num = instance_number(obj)
    while (instance_exists(obj))
        {
            inst = instance_find(obj,0);
            with (inst) {instance_destroy();}
        }
    error = string(num)+" instances destroyed";
}
else
{error = "no instances exist!";}

return(error);
