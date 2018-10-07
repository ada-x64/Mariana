///spawn_enemy_at_cursor(type, btype, bfreq, bspd, griddir, lifespan)
var error = "";
var type = argument0;
var btype = argument1;
var bfreq = argument2;
var bspd = argument3;
var griddir = argument4;
var lifespan = argument5;

var type_is_good = false;
for (var i=0; i<global.etype_count; i++)
{
    if (type == global.etype[i])
        {type_is_good = true; type = i; break;}
}
if (!type_is_good) {error += "type not found; defaulting to dummy"; type = Etype.dummy;}

type_is_good = false;
for (var i=0; i<global.btype_count; i++)
{
    if (btype == global.btype[i])
        {type_is_good = true; btype = i; break;}
}
if (!type_is_good) {error += "btype not found; defaulting to unaimed"; btype = Btype.unaimed;}

var e = enemy_create(type,btype,bfreq,bspd,griddir,lifespan);
enemy_spawn(e,mouse_x,mouse_y);
enemy_set_path(e,4,0,global.path_idle,0.5,path_action_restart);

return(error);
