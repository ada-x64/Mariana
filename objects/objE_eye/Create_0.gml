//draw
image_speed = 8/fps;
layer = global.enemy_layer
/**/
#region movement
if path_exists(path_sweep)
	path_start(path_sweep,0.75,path_action_restart,1);
else show_error("path index doesn't exist!",1);

pindex = path_sweep;
pspd   = 0.75;
ppos   = path_position;
prot   = path_orientation;
pend   = path_endaction;
pabs   = true;
#endregion path stuff
#region bullet stuff
//set vars
btype = Btype.burst3;
bspd = 1;
bdir = 0;
bcurve = 0;
bfreq = 0.25;
blifespan = -1;
bx = x+sprite_get_bbox_left(mask_index)+(sprite_get_bbox_right(mask_index)-sprite_get_bbox_left(mask_index))/2
by = y+sprite_get_bbox_bottom(mask_index);
btimer = 0;
btimer2 = 0;
bimmune = false;
//set array
barr = array_create(10)
barr[0]  = btype
barr[1]  = bspd
barr[2]  = bdir
barr[3]  = bcurve
barr[4]  = bfreq
barr[5]  = blifespan
barr[6]  = bx
barr[7]  = by
barr[8]  = btimer
barr[9]  = btimer2
barr[10] = bimmune
#endregion bullet stuff
#region hp stuff
hp = 3;
is_hurt = false;
hurt_timer = 0;
hx = 0;
hy = 0;
hparr = array_create(5);
hparr[0] = hp;
hparr[1] = is_hurt;
hparr[2] = hurt_timer;
hparr[3] = hx;
hparr[4] = hy;
max_hp = hp;
#endregion