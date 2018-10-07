///@function enemy_create(type, xgoal, ygoal, entry_curv, lifetime [, exit_curve, entry_spd, spd, btype, bfreq, bspd, bdir])
///@desc Creates an enemy and then instantly deactivates it; it is to be spawned later.
///@arg type
///@arg xgoal
///@arg ygoal
///@arg entry_curve
///@arg lifetime
///@arg exit_curve[...]

show_debug_message("Creating enemy...");
var enemy = instance_create_layer(-1,-1,global.enemy_layer,objE_parent);
with (enemy)
{
	//get args
	type		=     (argument[0]);
	xgoal		= real(argument[1]);
	ygoal		= real(argument[2]);
	entry_curve = real(argument[3]);
	lifespan	= real(argument[4]);
	exit_curve	= real(argument[5]);
	/*
	if argument_count > 5
	{
		var ext = true;
		entry_spd	= real(argument[6]);
		spd			= real(argument[7]);
		btype		=     (argument[8]);
		bfreq		= real(argument[9]);
		bspd		= real(argument[10]);
		bdir		= real(argument[11]);
	}
	else*/
	{
		var ext = false;
		entry_spd	= 1;
		spd			= 1;
		btype		= Btype.unaimed;
		bfreq		= 1;
		bspd		= 1;
		bdir		= 0;
	}
	/*
	show_debug_message("type="+string(type));
	show_debug_message("xgoal="+string(xgoal));
	show_debug_message("ygoal="+string(ygoal));
	show_debug_message("entry curve="+string(entry_curve));
	show_debug_message("lifespan="+string(lifespan));
	show_debug_message("exit curve="+string(exit_curve));
	*/
    //check type
    if !is_real(type)
    {
        var isFound = false;
        for (var i=0; i<global.etype_count;i++)
        {
            if type == global.etype[i]
            {
                type = i;
                isFound = true;
                break;
            }
        }
        if !isFound {type = Etype.dummy;}
    }
	
	//check extended
	if !ext
	{
		//typeswitch
		switch(type)
		{
			case(Etype.eye):
			{
				exit_curve	= 0;
				entry_spd	= 1;
				spd			= 0.75;
				btype		= Btype.burst3;
				bfreq		= 0.25;
				bspd		= 1;
				bdir		= 0;
				blifespan	=-1;
				break;
			}
			case(Etype.popcorn):
			{
				exit_curve	= 0;
				entry_spd	= 1;
				spd			= 0.25;
				btype		= Btype.unaimed;
				bfreq		= 1;
				bspd		= 1;
				bdir		= 270;
				blifespan	=-1;
				break;
			}
			default:
			{
				exit_curve	= 0;
				entry_spd	= 1;
				spd			= 1;
				btype		= Btype.unaimed;
				bfreq		= 1;
				bspd		= 1;
				bdir		= 270;
				blifespan	=-1;
				break;
			}
		}
	}
	else 
	{
	    if !is_real(btype)
	    {
	        var isFound = false;
	        for (var i=0; i<global.btype_count;i++)
	        {
	            if btype == global.btype[i]
	            {
	                btype = i
	                isFound = true;
	                break;
	            }
	        }
	        if !isFound {btype = Btype.unaimed;}
	    }
	}
}
instance_deactivate_object(enemy);

return(enemy);
