///destroy_all(object)
//destroys all instance of object.
var error = "managers destroyed!";
instance_destroy(BG_MANAGER);
instance_destroy(FOCUS_MANAGER);
instance_destroy(AUDIO_MANAGER);
instance_destroy(VIS_MANAGER);
instance_destroy(LEVEL_MANAGER);
instance_destroy(INITIALIZER);
instance_destroy(obj_debug_test_new);
instance_destroy(CAM);
instance_destroy(cam_focus);

return(error);
