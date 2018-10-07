///reset view and pos
cam_set_focus(room_width/2,room_height/2);
__view_set( e__VW.XView, 0, round(cam_focus.x - __view_get( e__VW.WView, 0 )/2 ))
__view_set( e__VW.YView, 0, round(cam_focus.y - __view_get( e__VW.HView, 0 )/2 ))

x = 0;
y = 0;
z = 0;

