///tl_T(new tempo, steps to get there)
show_debug_message("Tempo changing to "+string(argument0)+" in "+string(argument1)+" beats...");
if (argument1 != 0)
{
    var manager = instance_create_layer(0,0,global.background_layer,LEVEL_TEMPO_EDITOR);
    with (manager)
    {
        run = true;
        T = LEVEL_RUNNER.T; //old T
        t = argument0;      //new T
        s = argument1;      //steps to get there
    }
}
else
{
    T = argument0;
}
