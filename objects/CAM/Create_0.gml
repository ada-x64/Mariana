///init
if instance_number(object_index) > 1 {instance_destroy(self);}
//general
__view_set( e__VW.HSpeed, 0, -1 );
__view_set( e__VW.VSpeed, 0, -1 );

//shake
t_shake = 0;
d_shake = 0;
i_shake = 0;
shake = false;
vShake = false;
shakeType = camtype.constant;
shakeI = 0;

//zoom
zoom = false;
vZoom = false;
t1_zoom = 0;
t2_zoom = 0;
z_d1 = 0;
z_d2 = 0;
z_i = 1;
z_focus = cam_focus;
z_type1 = camtype.constant;
z_type2 = camtype.constant;
zI = 0;

//global surfaces
surf_border         = surface_create(room_width,room_height);

global.playarea_x1 = (INITIALIZER.ideal_width/2)-(4/6)*INITIALIZER.ideal_height;
global.playarea_x2 = (INITIALIZER.ideal_width/2)+(4/6)*INITIALIZER.ideal_height;
global.playarea_y1 = 0;
global.playarea_y2 = INITIALIZER.ideal_height-64;
global.playarea_width = global.playarea_x2 - global.playarea_x1;
global.playarea_height = global.playarea_y2 - global.playarea_y1;
global.playarea_midx = global.playarea_x1 + global.playarea_width/2;
global.playarea_midy = global.playarea_y1 + global.playarea_height/2;