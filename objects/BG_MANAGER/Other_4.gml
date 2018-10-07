///reset
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


if !layer_exists(global.background_layer) {global.background_layer = layer_create(50, "background layer");}
layer = global.background_layer;