///change_room(room)
rm = asset_get_index(argument0);
var error = "";

if room_exists(rm)
{
    if !(room == rm)
    {
        room_goto(rm);
        error = "room changed!";
    }
    else {error = argument0+" is the current room!";}
}
else
{
    error = "room not found";
}

return(error);
