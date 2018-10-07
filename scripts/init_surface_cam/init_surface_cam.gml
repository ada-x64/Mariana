///init_surface_cam(surfWidth,surfHeight);

surface = surface_create(64,64);

//general
surf_x = 0;
surf_y = 0;
surf_xscale = 1;
surf_yscale = 1;
surf_rot = 0;
surf_col = c_white;
surf_alpha = 1;
z=0;

//shake
surfShake = false;
vShake = false;
shakeType = camtype.constant;
shakeI = 0;
d_shake = 0;
i_shake = 0;
t_shake = 0;

//zoom
surfZoom = false;
vZoom = false;
zType1 = camtype.constant;
zType2 = camtype.constant;
z_d1 = 0;
z_d2 = 0;
t1_zoom = 0;
t2_zoom = 0;
t_zoom_pause = 0;
z_i = 0;
z_i_recent = 0;
zI = 0;

//dip back
surfDipBack = false;
vDipBack = false;
d_dip = 0;
t_dip = 0;
t_dip_transition = 0;
sprite_db = spr_console_selected;
image_db = 0;
x_db = surface_get_width(surface)/2;
y_db = surface_get_width(surface)/2;
alpha_db = 1;

