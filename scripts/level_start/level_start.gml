///level_start(filename)

if !instance_exists(LEVEL_RUNNER)
{
    instance_create_layer(x,y,global.background_layer,LEVEL_RUNNER);
}

with (LEVEL_RUNNER)
{
    level_load(argument0);
}

return("");
