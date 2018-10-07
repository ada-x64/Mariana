///level_build()
///@desc This script does semantic checking. It "builds" the level. It is predicated on level_load()
show_debug_message("===========================");
show_debug_message("== SCRIPT: level_build() ==");
show_debug_message("===========================");

//set default timeline settings
bps = 1; T = 60;
tl_timer = game_get_speed(gamespeed_fps) + 1;
z = 0;

//make the storage queue
tl_queue = ds_queue_create();

//cycle thru timeline list to add steps to TL and tl
for (var i=0; i<ds_list_size(tl_list); i++)
{
    temp[i] = "";
}
var i = 0;
while (ds_list_size(tl_list) != 0)
{
    var listlist = ds_list_find_value(tl_list,0);
    var f_list = ds_list_find_value(listlist,0);
    var a_list = ds_list_find_value(listlist,1);
    
    //reset funcs[]
    var func_num = 0;
    for (var n=0; n<10; n++)
    {
        for (var p=0; p<17; p++)
        {
            funcs[n,p] = tl_null;
        }
    }
    
    //show_debug_message("===== s t e p  "+string(i) + " =====");
    
    
    //-------------------
    //-- A C T I O N S --
    //-------------------
	#region
    var j = 0;
    var j_max = ds_list_size(a_list);
    while (ds_exists(a_list,ds_type_list) && ds_list_size(a_list) != 0)
    {
        //action
        var action = ds_list_find_value(a_list,0);
        //show_debug_message("f(" + string(func_num) + ") Action "+action);
        var isFound = false;
        
        //skip blanks
        if (action = "-")
        {
            ds_list_delete(a_list,0);
            j++;
            continue;
        }
        
        //search enemies
        for (var k=0; k<ds_list_size(e_list); k++)
        {
            var sublist = ds_list_find_value(e_list,k);
            if (sublist[|0] == action) //check to see if the name matches the action
            {
                isFound = true;
                var e = enemy_create(sublist[|1],sublist[|2],(sublist[|3]),(sublist[|4]),(sublist[|5]),(sublist[|6]));
                //n.b. - (x,y) needs to be dependent on rail position, and must be calculated at runtime!
                funcs[func_num,0] = (enemy_spawn);
                funcs[func_num,1] = e;
                funcs[func_num,2] = (j+1)/(j_max+1); //rail position
                func_num ++;
                break;
            }
            if (isFound) {break;}
        }
        //if it's not an enemy, it's a mistake
        if (!isFound)
            {show_error("Undefined action "+action, 1);}
        
        ds_list_delete(a_list,0);
        j++;
    }
    ds_list_destroy(a_list);
	#endregion
    
    //-----------------------
    //-- F U N C T I O N S --
    //-----------------------
	#region
    var j = 0;
    while (ds_exists(f_list,ds_type_list) && ds_list_size(f_list) != 0)
    {
        var p_list = ds_list_find_value(f_list,0);
        
        if !(ds_exists(p_list, ds_type_list))
        {
            ds_list_delete(f_list,0);
            j++;
            continue;
        }
        else if (ds_list_size(p_list) == 0)
        {
            ds_list_destroy(p_list);
            ds_list_delete(f_list,0);
            j++;
            continue;
        }
        
        var name = p_list[|0];
        show_debug_message(string(i)+"x"+string(j)+" f(" + string(func_num) + ") Function \'"+name+"\'");
        
        switch(name)
        {
            case("T"):
            {
                funcs[func_num,0] = (tl_T);
                funcs[func_num,1] = real(p_list[|1]); //tempo
                funcs[func_num,2] = real(p_list[|2]); //steps to get there
                func_num ++;
                break;
            }
            case("bps"):
            {
                funcs[func_num,0] = (tl_bps);
                funcs[func_num,1] = real(p_list[|1]); //bps
                func_num ++;
                break;
            }
            case ("lifespan"):
            {
                funcs[func_num,0] = (tl_lifespan);
                funcs[func_num,1] = p_list[|1]; //instance
                funcs[func_num,2] = real(p_list[|2]); //lifespan
                break;
            }
            case ("dir"):
            {
                funcs[func_num,0] = (tl_dir);
                funcs[func_num,1] = p_list[|1]; //enemy instance
                funcs[func_num,2] = real(p_list[|2]); //direction
                break;
            }
            case ("rot"):
            {
                funcs[func_num,0] = (tl_rot);
                funcs[func_num,1] = real(p_list[|1]); //new rot
                funcs[func_num,2] = real(p_list[|2]); //steps to get there
                break;
            }
            case ("curve"):
            {
                funcs[func_num,0] = (tl_curve);
                funcs[func_num,1] = real(p_list[|1]); //new curve
                funcs[func_num,2] = real(p_list[|2]); //steps to get there
                break;
            }
			case ("text"):
			{
				funcs[func_num,0] = (tl_text);
				funcs[func_num,1] = string(p_list[|1]); //who is saying it
				funcs[func_num,2] = string(p_list[|2]); //what is being said
				funcs[func_num,3] = real(p_list[|3]); //how long the message should be up
				break;
			}
            default:
            {
                show_debug_message("Function "+name+" at line "+string(i)+" not found!");
                func_num ++;
                break;
            }
        }
        
        //empty and destroy p_list
        while (ds_exists(p_list,ds_type_list) && ds_list_size(p_list) != 0)
        {
            ds_list_delete(p_list,0);
        }
        ds_list_destroy(p_list);
        
        ds_list_delete(f_list,0);
        j++;
    }
	#endregion
    
    //put funcs at tail of queue
    ds_queue_enqueue(tl_queue,funcs);
    //show_debug_message(ds_queue_tail(tl_queue))
    funcs = 0;
    
    ds_list_delete(tl_list,0); //not necessary for memory reasons, as was feared
    i++;
}
ds_list_destroy(tl_list); //frees both the mem location AND all the things it stored

show_debug_message("========================");
show_debug_message("== END: level_build() ==");
show_debug_message("========================");
