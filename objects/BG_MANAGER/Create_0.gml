///init vars
if instance_number(object_index) > 1 {instance_destroy(self);}
bg_color_timer = 0;

for (var i=0; i<3; i++)
{
    arr[i] = 0;
}

#region position
x = 0;
y = 0;
z = 0;
if !layer_exists(global.background_layer)
	global.background_layer = layer_create(90,"background layer");
layer = global.background_layer;
#endregion
#region background
//vars
CURVE    = 0;
curve_prev = 0;
ROT      = 0;
draw_bg = false;
grid_z = 0;
th_cylinder = 0;

var N = 1 - CURVE;
var R = display_get_gui_height()/2;
var W = R * (7*N + 1);

global.bg_ellipse_width  = W;
global.bg_ellipse_height = R;
global.bg_rotation = 0;
global.bg_curve = 0;
global.gridType = GridType.one_plane;
global.bg_alpha = 1;

//surface
surf3D_size = 1.25*display_get_gui_width()*sqrt(2)
surf3D       = surface_create(surf3D_size,surf3D_size);

//colour
global.bg_colour = make_colour_hsv(164,255,10); //c_black;
#endregion background