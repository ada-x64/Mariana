/// @description Insert description here
// You can write your code in this editor
var hx = choose(1,-1)*choose(8,16);
var hy = choose(1,-1)*choose(8,16);
x += hx;
y += hy;
if timer % 20 == 0
{
	fx_explode(sprite_width*2,sprite_height*2,layer);
}
x -= hx;
y -= hy;