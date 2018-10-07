///list_instances

var error = "";

for (var i = 0; i < instance_count; i ++)
{
    var o = instance_find(all,i);
    var O = o.object_index;
    error += object_get_name(O) + ": ("+string(o.x)+","+string(o.y)+")#";
}

return(error);
