///level_run()
///@desc This script runs the level. Like a compiler.

tl_speed = (bps)*(T/60);
global.bps = bps;
global.T = T;
global.tl_time = tl_speed + (delta_time)/100000;
tl_timer += global.tl_time;

#region draw circle - debug
/*
var circ_dist = global.playarea_width;
var tangent_x = global.playarea_x1 + global.playarea_width/2 + lengthdir_x(circ_dist,global.bg_rotation+90);
var tangent_y = global.playarea_y1 + global.playarea_height/2 + lengthdir_y(circ_dist,global.bg_rotation+90);
draw_set_color(c_teal)
draw_set_alpha(0.5);
layer = global.player_layer;
draw_circle(global.playarea_x1 + global.playarea_width/2, global.playarea_y1 + global.playarea_height/2,circ_dist,1);
draw_line(global.playarea_x1 + global.playarea_width/2,global.playarea_y1 + global.playarea_height/2,tangent_x,tangent_y);
draw_line(tangent_x + lengthdir_x(circ_dist*2*(-0.5),global.bg_rotation),tangent_y + lengthdir_y(circ_dist*2*(-0.5),global.bg_rotation),tangent_x + lengthdir_x(circ_dist*2*(-0.5 +1),global.bg_rotation),tangent_y + lengthdir_y(circ_dist*2*(-0.5+1),global.bg_rotation))
*/
#endregion

if (tl_timer > fps)
{
    //background_colour = merge_colour(c_white,background_colour,0.25);
    
    if ds_queue_empty(tl_queue)
    {
        ds_queue_destroy(tl_queue);
        //global.level = Level.none;
        show_debug_message("level_run() Complete!");
        show_debug_message("======================================");
        instance_destroy();
        exit;
    }
    else
    {
        F = ds_queue_dequeue(tl_queue);
        
        for (var n = 0; n <10; n++)
        {
            if (F[n,0] == enemy_spawn)
            {
				var circ_dist = global.playarea_width;
				var tangent_x = global.playarea_x1 + global.playarea_width/2 + lengthdir_x(circ_dist,global.bg_rotation+90);
				var tangent_y = global.playarea_y1 + global.playarea_height/2 + lengthdir_y(circ_dist,global.bg_rotation+90);
				var xx = tangent_x + lengthdir_x(circ_dist*2*(-0.5 + F[n,2]),global.bg_rotation) //global.playarea_x1 + global.playarea_width*F[n,2]
				var yy = tangent_y + lengthdir_y(circ_dist*2*(-0.5 + F[n,2]),global.bg_rotation) //global.playarea_height/2//*F[n,2];
				F[n,2] = xx;
                F[n,3] = yy;
            }
            
            script_execute(F[n,0],F[n,1],F[n,2],F[n,3],F[n,4],F[n,5],F[n,6],F[n,7],F[n,8],F[n,9],F[n,10],F[n,11],F[n,12],F[n,13],F[n,14],F[n,15],F[n,16])
        }
    }
    
    tl_timer = 0;
}
