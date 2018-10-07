/// @description Insert description here
// You can write your code in this editor
var hx = choose(1,-1)*choose(1,2,3);
var hy = choose(1,-1)*choose(1,2,3);
draw_set_alpha((4.75*fps-timer)/(4.75*fps));
image_speed = 2*global.speed_manip;
draw_sprite(sprite_index,image_index,x+hx,y+hy);
draw_sprite(spr_bigEyeHurt,image_index,x+hx,y+hy);