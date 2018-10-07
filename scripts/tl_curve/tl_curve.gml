///tl_curve(new curvature, steps to get there)
show_debug_message("Curve changing to "+string(argument0)+" in "+string(argument1)+" beats...");

if (argument1 != 0)
{
    var manager = instance_create_layer(0,0,global.background_layer,LEVEL_CURVE_EDITOR);
    with (manager)
    {
        run = true;
        CURVE = BG_MANAGER.CURVE; //old T
        curve = argument0;      //new T
        s = argument1;      //steps to get there
    }
}
else
{
    BG_MANAGER.CURVE = argument0;
}
