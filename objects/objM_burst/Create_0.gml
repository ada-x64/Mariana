r = 1;
size = max(room_width,room_height);

surf = surface_create(room_width,room_height);

cam_shake(1/2,4,camtype.negParabolic);
cam_shake_surface(objM,1/4,6,camtype.parabolic);

