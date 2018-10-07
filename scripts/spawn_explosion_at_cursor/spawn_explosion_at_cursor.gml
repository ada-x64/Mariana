///@function spawn_explosion_at_cursor()

error = "success!";
var prevx = x;
var prevy = y;

x = mouse_x;
y = mouse_y;
fx_explode(64,64,global.terminal_layer);
x = prevx;
y = prevy;

return error;