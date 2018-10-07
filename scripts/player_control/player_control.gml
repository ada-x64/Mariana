///@func player_control();
///@desc controls player movement
#region vars
//gamepad
var up		= C.padUp;
var upP		= C.padUpP;
var upR		= C.padUpR;

var down	= C.padDown;
var downP	= C.padDownP;
var downR	= C.padDownR;

var left	= C.padLeft;
var leftP	= C.padLeftP;
var leftR	= C.padLeftR;

var right	= C.padRight;
var rightP	= C.padRightP;
var rightR	= C.padRightR;

//left stick
var vaxis	= gamepad_axis_value(0,gp_axislv);
var haxis	= gamepad_axis_value(0,gp_axislh);
var vaxisr	= gamepad_axis_value(0,gp_axisrv);
var haxisr	= gamepad_axis_value(0,gp_axisrh);
var deadzone= 0.15;
gamepad_set_axis_deadzone(0,deadzone);

//buttons
var b_dash	= C.faceLeft or C.stickLeft or C.bumpLeft;
var b_dashP	= C.faceLeftP or C.stickLeftP or C.bumpLeftP;
var b_dashR	= C.faceLeftR or C.stickLeftR or C.bumpLeftR;

//speed
var spd = global.playarea_width/(4*fps);
var fric = spd/4;
#endregion vars
#region basic movement controls
//do dpad/arrow key controls
if (vaxis < deadzone and vaxis > -deadzone) and (haxis < deadzone and haxis > -deadzone)
{
	//get basic movement
	if up and not down		{yspd -= fric; yspd_store = yspd;}
	else if down and not up {yspd += fric; yspd_store = yspd;}
	else					{yspd -= sign(yspd)*fric;	     }
	
	if left and not right		{xspd -= fric; xspd_store = xspd;}
	else if right and not left	{xspd += fric; xspd_store = xspd;}
	else						{xspd -= sign(xspd)*fric;		 }
	
	if (up or down) and (left or right)
		{xspd += fric*dcos(dir); yspd += fric*dsin(dir)}
	
	if xspd > spd {xspd =  spd;}
	if xspd <-spd {xspd = -spd;}
	if yspd > spd {yspd =  spd;}
	if yspd <-spd {yspd = -spd;}
	if abs(yspd) < fric {yspd = 0;}
	if abs(xspd) < fric {xspd = 0;}
	
	//make sure it resets
	if (up or down) and not (left or right)
		{xspd_store = 0;}
	if (left or right) and not (up or down)
		{yspd_store = 0;}
	//get dir
	dir = darctan2(yspd_store,xspd_store);
}
//do joystick controls
else
{
	dir = darctan2(vaxis,haxis);
	//note: since either vaxis or haxis is outside the deadzone, player is moving.
	xspd = spd//*abs(haxis);
	yspd = spd//*abs(vaxis);
}
#endregion basic movement
#region dash
if b_dashP
{
	dash = true;
}
if dash
{
	dash_timer ++;
	var dd = fps/6 - dash_timer
	
	gamepad_set_vibration(0,dd/fps,dd/fps);
	
	x += lengthdir_x(64*dd/fps, dir);
	y -= lengthdir_y(64*dd/fps, dir);
	
	if dash_timer > fps/6
	{
		dash = false;
		dash_timer = 0;
	}
	
	//clamp
	if x < global.playarea_x1 {x -= lengthdir_x(128*dd/fps, dir);}
	if x > global.playarea_x2 {x -= lengthdir_x(128*dd/fps, dir);}
	if y < global.playarea_y1 {y += lengthdir_y(128*dd/fps, dir);}
	if y > global.playarea_y2 {y += lengthdir_y(128*dd/fps, dir);}
}
else {gamepad_set_vibration(0,0,0);}
#endregion dash
#region mp
if gamepad_is_connected(0)
{
	mp_dir = darctan2(-vaxisr,haxisr);
}
else
{
	mp_dir = point_direction(x,y,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
}
#endregion mp
//do speed
x += lengthdir_x(abs(xspd),dir);
y -= lengthdir_y(abs(yspd),dir);

//clamp position
if x < global.playarea_x1 {x -= lengthdir_x(abs(xspd),dir);}
if x > global.playarea_x2 {x -= lengthdir_x(abs(xspd),dir);}
if y < global.playarea_y1 {y += lengthdir_y(abs(yspd),dir);}
if y > global.playarea_y2 {y += lengthdir_y(abs(yspd),dir);}

