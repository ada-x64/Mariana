///@func enemy_init_bullets
///@param btype
///@param bspd
///@param bdir
///@param bcurve
///@param bfreq
///@param blifespan
///@param immune

var btype = argument0;
var bspd = argument1;
var bdir = argument2;
var bcurve = argument3;
var bfreq = argument4;
var blifespan = argument5;
var bx = x+sprite_get_bbox_left(mask_index)+(sprite_get_bbox_right(mask_index)-sprite_get_bbox_left(mask_index))/2
var by = y+sprite_get_bbox_bottom(mask_index);
var btimer = 0;
var btimer2 = 0;
var bimmune = argument6;
var barr = array_create(11)
barr[0] = btype
barr[1] = bspd
barr[2] = bdir
barr[3] = bcurve
barr[4] = bfreq
barr[5] = blifespan
barr[6] = bx
barr[7] = by
barr[8] = btimer
barr[9] = btimer2
barr[10] = bimmune
return barr;