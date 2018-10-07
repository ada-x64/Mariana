///Systems Controller
if instance_number(object_index) > 1 {instance_destroy(self);}
//controller
gamepad_set_axis_deadzone(0,0.5);
useJoystickAsDpad = true;

hAxisL = gamepad_axis_value(0,gp_axislh);
vAxisL = gamepad_axis_value(0,gp_axislv);
hAxisR = gamepad_axis_value(0,gp_axisrh);
vAxisR = gamepad_axis_value(0,gp_axisrv);

arr = array_create(48); //16*3
for (var i=0; i<array_length_1d(arr); i++)
{arr[i] = false;}

ENUM_BUTTONS();

#region init vars
/**/
padUp = false;
padUpP = false;//gamepad_button_check_pressed (0,gp_padu) or keyboard_check_pressed(ord("W"))
padUpR = false;//gamepad_button_check_released (0,gp_padu) or keyboard_check_released(ord("W"))

padDown = false;//(gamepad_button_check (0,gp_padd)) or (keyboard_check(ord("S")))  or (vAxisL > 0 and vCondition and useJoystickAsDpad)
padDownP = false;//(gamepad_button_check_pressed (0,gp_padd)) or (keyboard_check_pressed(ord("S")))
padDownR = false;//(gamepad_button_check_released (0,gp_padd)) or (keyboard_check_released(ord("S")))

padLeft = false;//(gamepad_button_check (0,gp_padl)) or (keyboard_check(ord("A"))) or (hCondition and hAxisL < 0 and useJoystickAsDpad)
padLeftP = false;//(gamepad_button_check_pressed (0,gp_padl)) or (keyboard_check_pressed(ord("A")))
padLeftR = false;//(gamepad_button_check_released (0,gp_padl)) or (keyboard_check_released(ord("A")))

padRight = false;//(gamepad_button_check (0,gp_padr)) or (keyboard_check(ord("D"))) or (hCondition and hAxisL > 0 and useJoystickAsDpad)
padRightP = false;//(gamepad_button_check_pressed (0,gp_padr)) or (keyboard_check_pressed(ord("D")))
padRightR = false;//(gamepad_button_check_released (0,gp_padr)) or (keyboard_check_released(ord("D")))

faceUp = false;//(gamepad_button_check (0,gp_face4)) or (keyboard_check(ord("A")))
faceUpP = false;//(gamepad_button_check_pressed (0,gp_face4)) or (keyboard_check_pressed(ord("A")))
faceUpR = false;//(gamepad_button_check_released (0,gp_face4)) or (keyboard_check_released(ord("A")))

faceDown = false;//(gamepad_button_check (0,gp_face1)) or (keyboard_check(ord("S")))
faceDownP = false;//(gamepad_button_check_pressed (0,gp_face1)) or (keyboard_check_pressed(ord("S")))
faceDownR = false;//(gamepad_button_check_released (0,gp_face1)) or (keyboard_check_released(ord("S")))

faceLeft = false;//(gamepad_button_check (0,gp_face3)) or (keyboard_check(ord("D")))
faceLeftP = false;//(gamepad_button_check_pressed (0,gp_face3)) or (keyboard_check_pressed(ord("D")))
faceLeftR = false;//(gamepad_button_check_released (0,gp_face3)) or (keyboard_check_released(ord("D")))

faceRight = false;//(gamepad_button_check (0,gp_face2)) or (keyboard_check(ord("F")))
faceRightP = false;//(gamepad_button_check_pressed (0,gp_face2)) or (keyboard_check_pressed(ord("F")))
faceRightR = false;//(gamepad_button_check_released (0,gp_face2)) or (keyboard_check_released(ord("F")))

bumpRight = false;//(gamepad_button_check(0,gp_shoulderr)) or (keyboard_check(ord("E")))
bumpRightP = false //(gamepad_button_check_pressed(0,gp_shoulderr)) or (keyboard_check_pressed(ord("E")))
bumpRightR = false //(gamepad_button_check_released(0,gp_shoulderr)) or (keyboard_check_released(ord("E")))

bumpLeft = false //(gamepad_button_check(0,gp_shoulderl)) or (keyboard_check(ord("Q")))
bumpLeftP = false //(gamepad_button_check_pressed(0,gp_shoulderl)) or (keyboard_check_pressed(ord("Q")))
bumpLeftR = false //(gamepad_button_check_released(0,gp_shoulderl)) or (keyboard_check_released(ord("Q")))

stickLeft = false //(gamepad_button_check(0,gp_stickl)) || keyboard_check(ord("Z"));
stickLeftP = false //(gamepad_button_check_pressed(0,gp_stickl)) || keyboard_check_pressed(ord("Z"));
stickLeftR = false //(gamepad_button_check_released(0,gp_stickl)) || keyboard_check_released(ord("Z"));

stickRight = false //(gamepad_button_check(0,gp_stickr)) || keyboard_check(ord("X"));
stickRightP = false //(gamepad_button_check_pressed(0,gp_stickr)) || keyboard_check_pressed(ord("X"));
stickRightR = false //(gamepad_button_check_released(0,gp_stickr)) || keyboard_check_released(ord("X"));

trigRight = false //(gamepad_button_check(0,gp_shoulderrb)) or (keyboard_check(ord("R")))
trigRightP = false //(gamepad_button_check_pressed(0,gp_shoulderrb)) or (keyboard_check_pressed(ord("R")))
trigRightR = false //(gamepad_button_check_released(0,gp_shoulderrb)) or (keyboard_check_released(ord("R")))

trigLeft = false //(gamepad_button_check(0,gp_shoulderlb)) or (keyboard_check(ord("Q")))
trigLeftP = false //(gamepad_button_check_pressed(0,gp_shoulderlb)) or (keyboard_check_pressed(ord("Q")))
trigLeftR = false //(gamepad_button_check_released(0,gp_shoulderlb)) or (keyboard_check_released(ord("Q")))

start = false //(gamepad_button_check(0,gp_start)) or (keyboard_check(vk_enter))
startP = false //(gamepad_button_check_pressed(0,gp_start)) or (keyboard_check_pressed(vk_enter))
startR = false //(gamepad_button_check_released(0,gp_start)) or (keyboard_check_released(vk_enter))

select = false //(gamepad_button_check(0,gp_select)) or (keyboard_check(vk_shift))
selectP = false //(gamepad_button_check_pressed(0,gp_select)) or (keyboard_check_pressed(vk_shift))
selectR = false //(gamepad_button_check_released(0,gp_select)) or (keyboard_check_released(vk_shift))
#endregion