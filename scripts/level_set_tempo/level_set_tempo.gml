///level_set_tempo(new tempo, beats to transition)

if !instance_exists(LEVEL_RUNNER)
    {
    return("No instance of LEVEL_RUNNER");
    }
with (LEVEL_RUNNER)
{
    if ds_exists(tl_queue,ds_type_queue)
    {
        tl_T(argument0,argument1);
    }
    else
    {
        return("No queue in progress");
    }
}
return("");
