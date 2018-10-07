//draw
image_speed = 8/fps;
spr_rot = 0;

#region movement
intro_start = true;
intro_done = false;
entry_path = noone;
intro_pspd = 1;
exiting = false;
exit_path = noone;
exit_pspd = 1;
lifespan_timer = 0;
pindex = path_idle;
pspd   = 0.25;
ppos   = path_position;
prot   = path_orientation;
pend   = path_endaction;
pabs   = false;
#endregion path stuff
#region bullet stuff
//set vars
btype = Btype.unaimed;
bspd = 1;
bdir = -90;
bcurve = 0;
bfreq = 1;
blifespan = -1;
bx = x+sprite_get_bbox_left(mask_index)+(sprite_get_bbox_right(mask_index)-sprite_get_bbox_left(mask_index))/2
by = y+sprite_get_bbox_bottom(mask_index);
btimer = 0;
btimer2 = 0;
bimmune = false;
//assign them to the array
barr = array_create(11)
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
hp = 1;
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