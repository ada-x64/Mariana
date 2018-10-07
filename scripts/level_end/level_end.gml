///level_end()

if !instance_exists(LEVEL_RUNNER)
{
    return("No instance of LEVEL_RUNNER");
}

with (LEVEL_RUNNER)
{
    global.level = Level.none;
    if ds_exists(tl_queue,ds_type_queue)
    {
        ds_queue_destroy(tl_queue);
    }
    else
    {
        return("No level queue in progress");
    }
    
    instance_destroy();
}

return("");
