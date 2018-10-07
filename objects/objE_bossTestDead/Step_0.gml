/// @description Insert description here
// You can write your code in this editor
timer ++;

global.speed_manip = timer/(fps*5);

if timer >= fps*5
{
	global.speed_manip = 1;
	instance_destroy();
}