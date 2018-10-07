////spawn_selected(x,y)
//spawns selected at (x,y)
var error = "";
var xx = argument0;
var yy = argument1;

if instance_exists(DEV_TERMINAL.selected_instance)
{
    var inst = DEV_TERMINAL.selected_instance;
    var obj = inst.object_index;
    if (object_get_name(obj) == "objB" || object_get_name(obj) == "DEV_TERMINAL")
    {
        error = "Cannot clone this instance!";
        return(error);
    }
    error = "instance "+object_get_name(obj)+" cloned."
    instance_create_layer(xx,yy,global.background_layer,obj);
}
else {error = "no instance selected";}

return(error);
