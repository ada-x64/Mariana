///level_load(filename)
///@desc This function reads in the file and checks syntax. Semantic checks are done in level_build()

show_debug_message("==========================");
show_debug_message("== SCRIPT: level_load("+string(argument0)+") ==");
show_debug_message("==========================");
//----------------------------------------------------

//READ THE FILE --------------------------------------
var line_queue = ds_queue_create();
//
e_params = 7;
//
var fn = working_directory + "\\Levels\\" + argument0;
//----------------------------------------------------

//check if file exists
if file_exists(fn)
    {
    var fstream = file_text_open_read(fn);
    //show_debug_message(fn + " was found!");
    }
else
    {show_error(fn+" does not exist!",1);}

//read the file, add lines to queue
while (!file_text_eof(fstream))
{
    var Line = file_text_readln(fstream);
    ds_queue_enqueue(line_queue,Line);
}
file_text_close(fstream);

//----------------------------------------------------
//-* * * * * * * * * * * * * * * * * * * * * * * * * -
//----------------------------------------------------

//PARSING --------------------------------------------
e_list = ds_list_create();
tl_list = ds_list_create();
//----------------------------------------------------

while (!ds_queue_empty(line_queue))
{
    var line = ds_queue_head(line_queue);
    ds_queue_dequeue(line_queue);
    var i = 1;
    
    while (string_char_at(line,i) == " ")
        {i++;} //skip whitespace
    
    //--------------------------------//
    //--- G R I D  S E T T I N G S ---//
    //--------------------------------//
    #region
    if (string_char_at(line,i) == "#")
    {
        if (string_pos("grid_type", line) == i+1)
        {
            while (string_char_at(line,i) != "=")
            {
                i++;
            }
            i++;
            while (string_char_at(line,i) == " ")
            {
                i++;
            }
            var count = string_length(line) - i - 1;
            var gt = string_copy(line,i,count);
            var isFound = false;
            
            for (var j = 0; j < global.gridtype_count; j++)
            {
                if global.gridtype[j] == gt
                    {
                    global.gridType = j;
                    isFound = true;
                    break;
                    }
            }
            if (!isFound)
            {
                global.gridType = GridType.one_plane;
                show_debug_message("gridtype " + string(gt) + " not found! defaulting to one_plane");
            }
        }
    
    }
    #endregion
    //-----------------------------//
    //--- D E F I N I T I O N S ---//
    //-----------------------------//
    #region
    else if (string_char_at(line,i) == "&")
    {
        //show_debug_message('--------------------');
        
        i++;
        var name = string_char_at(line,i);
        
        //skip until we reach the definition
        while(string_char_at(line,i) != "E")
            {i++;}
        
        //DEFINE THE THINGS
        if (string_char_at(line,i) = "E")
        {
            var defType = e_params;
            var defList = e_list;
            
            //initialize storage array
            for (var j=0;j<defType;j++)
                {arr[j] = "";}
            
            while(string_char_at(line,i) != "(") {i++;}
            i++;
            
            //read in parameters
            var k = 0;
            while (string_char_at(line,i) != ")")
            {
                while (string_char_at(line,i) != ",")
                {
                
                    if (string_char_at(line,i) == ")")
                        {break;}
                        
                    else if (string_char_at(line,i) != " ")
                    {
                        arr[k] += string_char_at(line,i);
                        i++;
                    }
                    
                    else if (string_char_at(line,i) == " ")
                        {i++;}
                }
                
                //show_debug_message(arr[k]);
                if (string_char_at(line,i) == ")")
                        {break;}
                        
                i++
                k++;
                if (k > defType)
                    {show_error("incorrect number of parameters!",1);}
            }
                
            //store parameters
            var o = ds_list_create()
            ds_list_add(defList,o);
            ds_list_add(o,name);
            for (var i=0; i<defType; i++)
            {
                ds_list_add(o,arr[i]);
            }
        }
            
    arr = 0;
    //show_debug_message('--------------------');
    }
    #endregion
    //-----------------------//
    //--- T I M E L I N E ---//
    //-----------------------//
    #region
    else if (string_char_at(line,i) == "_")
    {
        i++;
        
        //create nested list to act like variable length 2D pointer
        var listlist = ds_list_create(); //list to hold f_list and a_list
        f_list = ds_list_create();   //function list holds parameter lists
        a_list = ds_list_create();   //action list holds
        ds_list_insert(tl_list,0,listlist); //add front
        ds_list_add(listlist,f_list);
        ds_list_add(listlist,a_list);
        
        var str = "";
        while (string_char_at(line,i) != "_")
        {
            ds_list_add(a_list,string_char_at(line,i)); //add_back
            ////show_debug_message(ds_list_find_value(a_list, ds_list_size(a_list)-1 ) );
            str += string_char_at(line,i);
            i++;
        }
        i++; 
        
        var p_pos = 0;
        //for the remainder of the line, look for functions
        while (i < string_length(line)-1)
        {
            //skip whitespace
            while (string_char_at(line,i) == " ")
            {
                i++;
                if (i > string_length(line))
                    {break;}
            }
            
            if (i > string_length(line))
                {break;}
            
                
            //get functions
            if (string_char_at(line,i) != " " && i < string_length(line))
            {
                //create a list to store this information
                var p_list = ds_list_create();
                ds_list_add(f_list,p_list);
                
                //get function name
                var f_name = "";
                while (string_char_at(line,i) != "(")
                {
                    if (string_char_at(line,i) != " ")
                    {
                        f_name += string_char_at(line,i);
                    }
                    
                    i++;
                    
                    if (i > string_length(line))
                        {break;}
                    
                }
                i++;
                ds_list_add(p_list,f_name); //p_list[|0] = "name"
                p_pos ++;
                //show_debug_message(string(p_pos) + ": " + ds_list_find_value(p_list, ds_list_size(p_list)-1 ) );
                
                //var p_string = "(";
                
                //get parameters
                while (string_char_at(line,i) != ")")
                {
                    //reset parameter name
                    var p_name = "";
                    
                    while (string_char_at(line,i) != ",")
                    {
                        if (string_char_at(line,i) == ")")
                            {break;}
                            
                        else if (string_char_at(line,i) != " ")
                        {
                            p_name += string_char_at(line,i);
                            i++;
                        }
                        
                        else if (string_char_at(line,i) == " ")
                            {i++;}
                            
                        if (i > string_length(line))
                            {break;}
                    }
                    //p_list[|i] = p(i-1)
                    ds_list_add(p_list,p_name);
                    //p_string += (ds_list_find_value(p_list, ds_list_size(p_list)-1 ) + ", ");
                    
                    if (i > string_length(line))
                        {break;}
                    else if (string_char_at(line,i) == ")")
                        {break;}
                    
                    i++;
                    
                }
                i++;
                ////show_debug_message("    >"+p_string + ")")
            }
        }
        str += ("      f("+string(p_pos)+")");
        //show_debug_message(str);
    }
    //---------------------------------------------------------------------------------------------
    #endregion
}
//destroy the queue
ds_queue_destroy(line_queue);

//build the level
level_build();

//------------------------------------------------------------
//- END OF MAIN FUNCTION, THE REST IS FOR DEBUGGING PURPOSES -
//------------------------------------------------------------
    
/*
//kick back the stuff, to check it stored correctly.
//also, test accessing members of the list
//show_debug_message("e_list:")
for (var i = 0; i < ds_list_size(e_list); i ++)
{
    var sublist = ds_list_find_value(e_list,i);
    var par_string = "(";
    for (var j = 0; j < ds_list_size(sublist); j ++)
    {
        var str = ds_list_find_value(sublist,j);
        par_string += str + ",";
    }
    par_string += ")";
    show_debug_message(par_string);
}

//show_debug_message("o_list:")
for (var i = 0; i < ds_list_size(o_list); i ++)
{
    var sublist = ds_list_find_value(o_list,i);
    var par_string = "(";
    for (var j = 0; j < ds_list_size(sublist); j ++)
    {
        var str = ds_list_find_value(sublist,j);
        par_string += str + ",";
    }
    par_string += ")";
    show_debug_message(par_string);
}

//show_debug_message("tl_list:")
for (var k = 0; k < ds_list_size(tl_list); k ++)
{
    var sublist_l = ds_list_find_value(tl_list,k);
    var sublist_f = ds_list_find_value(sublist_l,0);
    var sublist_a = ds_list_find_value(sublist_l,1);
    var str_f = "FUNCS :: [" + string(ds_list_size(sublist_f)) +"] ";
    var str_a = "LINE  :: [" + string(ds_list_size(sublist_a)) +"] ";
    for (var l=0; l<ds_list_size(sublist_f); l++)
    {
        var sublist_p = ds_list_find_value(sublist_f,l);
        str_f += string(l+1) + ": (";
        for (var j=0; j<ds_list_size(sublist_p); j++)
        {
            str_f += ds_list_find_value(sublist_p,j) + "; ";
        }
        str_f += ") "
    }
    for (var l=0; l<ds_list_size(sublist_a); l++)
    {
        str_a += ds_list_find_value(sublist_a,l);
    }
    show_debug_message(str_f);
    show_debug_message(str_a);
    
}
*/
