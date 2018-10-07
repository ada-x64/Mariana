/// @description Insert description here
// You can write your code in this editor
var e;
switch (type)
{
	case (Etype.eye):
	{
		e = instance_create_layer(x,y,global.enemy_layer,objE_eye);
		instance_destroy(self);
		break;
	}
	case (Etype.popcorn):
	{
		e = instance_create_layer(x,y,global.enemy_layer,objE_popcorn);
		instance_destroy(self);
		break;
	}
}

with e
{
	type		= other.type;
	xgoal		= global.playarea_x1 + global.playarea_width  * other.xgoal;
	ygoal		= global.playarea_y1 + global.playarea_height * other.ygoal;
	entry_curve = other.entry_curve;
	lifespan	= other.lifespan;
	exit_curve	= other.exit_curve;
	entry_spd	= other.entry_spd;
	pspd		= other.spd;
	btype		= other.btype;
	bfreq		= other.bfreq;
	bspd		= other.bspd;
	bdir		= other.bdir;
}