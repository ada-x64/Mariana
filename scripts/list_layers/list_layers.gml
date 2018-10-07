var error = "";

var arr = layer_get_all();
for (var i = 0; i < array_length_1d(arr); i++)
{
	if layer_get_name(arr[i]) = "" {error += "unnamed layer, depth "+string(layer_get_depth(arr[i]))+"#"}
	else {error += layer_get_name(arr[i])+" depth "+string(layer_get_depth(arr[i])) + "#";}
}
error += "total: "+string(array_length_1d(arr))
return error;