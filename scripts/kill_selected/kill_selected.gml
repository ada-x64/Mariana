///@func kill_selected()

error = "success!";

if instance_exists(DEV_TERMINAL.selected_instance)
{
	var e = DEV_TERMINAL.selected_instance;
	if variable_instance_exists(e,"hp")
		{e.hp = 0;}
	else {error = "selected instance has no hp!";}
}
else error = "no instance selected";

return error;