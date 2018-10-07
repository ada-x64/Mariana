///spawn_at_cursor(object)

var obj = asset_get_index(argument0);
var error = "";

if (object_exists(obj)) {instance_create_layer(mouse_x,mouse_y,global.background_layer,obj);}
else {error = "object not found";}

return(error);
    
