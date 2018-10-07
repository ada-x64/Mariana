///@function kill_player()
//kills the player

error = "Success!";

if (instance_exists(objM))
	{objM.hp = -1;}
else
	{error = "No player instance found!"}

return error;