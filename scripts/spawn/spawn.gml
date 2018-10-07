///@func spawn(x,y,object)
///@param x
///@param y
///@param obj

var obj = asset_get_index(argument2);
var error = "";

if (object_exists(obj)) {instance_create_layer(argument0,argument1,global.background_layer,obj);}
else {error = "object not found";}

show_debug_message(error);
return(error);