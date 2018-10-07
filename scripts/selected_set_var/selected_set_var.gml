///@func boss_set_hp(var,value)
///@param var
///@param val

var error = "no instance selected!";

if instance_exists(DEV_TERMINAL.selected_instance)
{
	error = "instance found!";
	var inst = DEV_TERMINAL.selected_instance;
	var vars = variable_instance_get_names(inst);
	for (var i = 0; i < array_length_1d(vars); i++)
	{
		if string(argument0) == vars[i]
		{
			var v = variable_instance_get(inst,vars[i]);
			if is_real(v)
			{
				variable_instance_set(inst,argument0,real(argument1));
			}
			else if is_string(v)
			{
				variable_instance_set(inst,argument0,string(argument1));
			}
			else if is_bool(v)
			{
				if argument1 == "y" or argument1 == "yes" or argument1 == "t" or argument1 == "true" or argument1 == "1"
					variable_instance_set(inst,argument0,(true));
				else if argument1 == "n" or argument1 == "no" or argument1 == "f" or argument1 == "false" or argument1 == "0"
					variable_instance_set(inst,argument0,(false));
			}
			else if is_array(v) or is_matrix(v) or is_ptr(v)
			{
				error = "variable is array, matrix, or pointer; will probably crash if replaced!";
			}
			else 
			{
				if string_digits(argument0) == argument0
					{variable_instance_set(inst,argument0,real(argument1));}
				else
					{variable_instance_set(inst,argument0,argument1);}
				error = "variable not found! creating it anyways.";
			}
		}
	}
}

return error;