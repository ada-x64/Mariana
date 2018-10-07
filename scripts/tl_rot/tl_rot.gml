///tl_rot(new rot, steps to get there)

newRot = argument0;
while (newRot <= 0)
{
    newRot += 360;
}
while (newRot > 360)
{
    newRot -= 360;
}

show_debug_message("Rotation changing to "+string(newRot)+" in "+string(argument1)+" beats...");
if (argument1 != 0)
{
    var manager = instance_create_layer(0,0,global.background_layer,LEVEL_ROT_EDITOR);
    with (manager)
    {
        run = true;
        ROT = BG_MANAGER.ROT; //old rot
        rot = other.newRot;      //new rot
        s = argument1;      //steps to get there
    }
}
else
{
    BG_MANAGER.ROT = argument0;
}
