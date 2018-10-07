//controller input
//joystick logic
hAxisL = gamepad_axis_value(0,gp_axislh);
vAxisL = gamepad_axis_value(0,gp_axislv);
hAxisR = gamepad_axis_value(0,gp_axisrh);
vAxisR = gamepad_axis_value(0,gp_axisrv);

#region defining button inputs as variables

var vCondition = (abs(hAxisL) < (4/3)*abs(vAxisL));
var hCondition = (abs(vAxisL) < (4/3)*abs(hAxisL));

arr[Button.padUp] = gamepad_button_check (0,gp_padu) or keyboard_check(ord("W")) or keyboard_check(vk_up) or (vAxisL < 0 and vCondition and useJoystickAsDpad)
arr[Button.padUpP] = gamepad_button_check_pressed (0,gp_padu) or keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)
arr[Button.padUpR] = gamepad_button_check_released (0,gp_padu) or keyboard_check_released(ord("W")) or keyboard_check_released(vk_up)

arr[Button.padDown] = (gamepad_button_check (0,gp_padd)) or (keyboard_check(ord("S"))) or keyboard_check(vk_down)  or (vAxisL > 0 and vCondition and useJoystickAsDpad)
arr[Button.padDownP] = (gamepad_button_check_pressed (0,gp_padd)) or (keyboard_check_pressed(ord("S"))) or keyboard_check_pressed(vk_down)
arr[Button.padDownR] = (gamepad_button_check_released (0,gp_padd)) or (keyboard_check_released(ord("S"))) or keyboard_check_released(vk_down)

arr[Button.padLeft] = (gamepad_button_check (0,gp_padl)) or (keyboard_check(ord("A"))) or keyboard_check(vk_left) or (hCondition and hAxisL < 0 and useJoystickAsDpad)
arr[Button.padLeftP] = (gamepad_button_check_pressed (0,gp_padl)) or (keyboard_check_pressed(ord("A"))) or keyboard_check_pressed(vk_left)
arr[Button.padLeftR] = (gamepad_button_check_released (0,gp_padl)) or (keyboard_check_released(ord("A"))) or keyboard_check_released(vk_left)

arr[Button.padRight] = (gamepad_button_check (0,gp_padr)) or (keyboard_check(ord("D"))) or keyboard_check(vk_right) or (hCondition and hAxisL > 0 and useJoystickAsDpad)
arr[Button.padRightP] = (gamepad_button_check_pressed (0,gp_padr)) or (keyboard_check_pressed(ord("D"))) or keyboard_check_pressed(vk_right)
arr[Button.padRightR] = (gamepad_button_check_released (0,gp_padr)) or (keyboard_check_released(ord("D"))) or keyboard_check_released(vk_right)

arr[Button.faceUp] = (gamepad_button_check (0,gp_face4)) or (keyboard_check(ord("A")))
arr[Button.faceUpP] = (gamepad_button_check_pressed (0,gp_face4)) or (keyboard_check_pressed(ord("A")))
arr[Button.faceUpR] = (gamepad_button_check_released (0,gp_face4)) or (keyboard_check_released(ord("A")))

//bubble
arr[Button.faceDown] = (gamepad_button_check (0,gp_face1)) or mouse_check_button(mb_left)//(keyboard_check(ord("S")))
arr[Button.faceDownP] = (gamepad_button_check_pressed (0,gp_face1)) or  mouse_check_button_pressed(mb_left)//(keyboard_check_pressed(ord("S")))
arr[Button.faceDownR] = (gamepad_button_check_released (0,gp_face1)) or mouse_check_button_released(mb_left) //(keyboard_check_released(ord("S")))

//dash
arr[Button.faceLeft] = (gamepad_button_check (0,gp_face3)) or (keyboard_check(vk_shift)) or mouse_check_button(mb_right)//
arr[Button.faceLeftP] = (gamepad_button_check_pressed (0,gp_face3)) or (keyboard_check_pressed(vk_shift)) or mouse_check_button_pressed(mb_right)
arr[Button.faceLeftR] = (gamepad_button_check_released (0,gp_face3)) or (keyboard_check_released(vk_shift)) or mouse_check_button_released(mb_right)

//special
arr[Button.faceRight] = (gamepad_button_check (0,gp_face2)) or mouse_check_button(mb_middle)//or (keyboard_check(ord("F")))
arr[Button.faceRightP] = (gamepad_button_check_pressed (0,gp_face2)) or mouse_check_button_pressed(mb_middle)//or (keyboard_check_pressed(ord("F")))
arr[Button.faceRightR] = (gamepad_button_check_released (0,gp_face2)) or mouse_check_button_released(mb_middle)//or (keyboard_check_released(ord("F")))

arr[Button.bumpRight] = (gamepad_button_check(0,gp_shoulderr)) or (keyboard_check(ord("E")))
arr[Button.bumpRightP] = (gamepad_button_check_pressed(0,gp_shoulderr)) or (keyboard_check_pressed(ord("E")))
arr[Button.bumpRightR] = (gamepad_button_check_released(0,gp_shoulderr)) or (keyboard_check_released(ord("E")))

arr[Button.bumpLeft] = (gamepad_button_check(0,gp_shoulderl)) or (keyboard_check(ord("Q")))
arr[Button.bumpLeftP] = (gamepad_button_check_pressed(0,gp_shoulderl)) or (keyboard_check_pressed(ord("Q")))
arr[Button.bumpLeftR] = (gamepad_button_check_released(0,gp_shoulderl)) or (keyboard_check_released(ord("Q")))

arr[Button.stickLeft] = (gamepad_button_check(0,gp_stickl)) || keyboard_check(ord("Z"));
arr[Button.stickLeftP] = (gamepad_button_check_pressed(0,gp_stickl)) || keyboard_check_pressed(ord("Z"));
arr[Button.stickLeftR] = (gamepad_button_check_released(0,gp_stickl)) || keyboard_check_released(ord("Z"));

arr[Button.stickRight] = (gamepad_button_check(0,gp_stickr)) || keyboard_check(ord("X"));
arr[Button.stickRightP] = (gamepad_button_check_pressed(0,gp_stickr)) || keyboard_check_pressed(ord("X"));
arr[Button.stickRightR] = (gamepad_button_check_released(0,gp_stickr)) || keyboard_check_released(ord("X"));

arr[Button.trigRight] = (gamepad_button_check(0,gp_shoulderrb)) or (keyboard_check(ord("R")))
arr[Button.trigRightP] = (gamepad_button_check_pressed(0,gp_shoulderrb)) or (keyboard_check_pressed(ord("R")))
arr[Button.trigRightR] = (gamepad_button_check_released(0,gp_shoulderrb)) or (keyboard_check_released(ord("R")))

arr[Button.trigLeft] = (gamepad_button_check(0,gp_shoulderlb)) or (keyboard_check(ord("Q")))
arr[Button.trigLeftP] = (gamepad_button_check_pressed(0,gp_shoulderlb)) or (keyboard_check_pressed(ord("Q")))
arr[Button.trigLeftR] = (gamepad_button_check_released(0,gp_shoulderlb)) or (keyboard_check_released(ord("Q")))

arr[Button.start] = (gamepad_button_check(0,gp_start)) or (keyboard_check(vk_enter))
arr[Button.startP] = (gamepad_button_check_pressed(0,gp_start)) or (keyboard_check_pressed(vk_enter))
arr[Button.startR] = (gamepad_button_check_released(0,gp_start)) or (keyboard_check_released(vk_enter))

arr[Button.select] = (gamepad_button_check(0,gp_select)) or (keyboard_check(vk_shift))
arr[Button.selectP] = (gamepad_button_check_pressed(0,gp_select)) or (keyboard_check_pressed(vk_shift))
arr[Button.selectR] = (gamepad_button_check_released(0,gp_select)) or (keyboard_check_released(vk_shift))
#endregion
#region feed back into variables
padUp  = arr[Button.padUp]
padUpP = arr[Button.padUpP]
padUpR = arr[Button.padUpR]
	
padDown  = arr[Button.padDown]
padDownP = arr[Button.padDownP]
padDownR = arr[Button.padDownR]

padLeft = arr[Button.padLeft]
padLeftP = arr[Button.padLeftP] 
padLeftR = arr[Button.padLeftR] 

padRight = arr[Button.padRight]
padRightP = arr[Button.padRightP] 
padRightR = arr[Button.padRightR]

faceUp = arr[Button.faceUp] 
faceUpP = arr[Button.faceUpP] 
faceUpR = arr[Button.faceUpR] 

faceDown = arr[Button.faceDown]
faceDownP = arr[Button.faceDownP]
faceDownR = arr[Button.faceDownR]

faceLeft = arr[Button.faceLeft]
faceLeftP = arr[Button.faceLeftP]
faceLeftR = arr[Button.faceLeftR]

faceRight  = arr[Button.faceRight]
faceRightP = arr[Button.faceRightP]
faceRightR = arr[Button.faceRightR]

bumpRight  = arr[Button.bumpRight]
bumpRightP = arr[Button.bumpRightP]
bumpRightR = arr[Button.bumpRightR]

bumpLeft  = arr[Button.bumpLeft]
bumpLeftP = arr[Button.bumpLeftP]
bumpLeftR = arr[Button.bumpLeftR]

stickLeft  = arr[Button.stickLeft]
stickLeftP = arr[Button.stickLeftP]
stickLeftR = arr[Button.stickLeftR]

stickRight  = arr[Button.stickRight]
stickRightP = arr[Button.stickRightP]
stickRightR = arr[Button.stickRightR]

trigRight  = arr[Button.trigRight]
trigRightP = arr[Button.trigRightP]
trigRightR = arr[Button.trigRightR]

trigLeft = arr[Button.trigLeft] 
trigLeftP = arr[Button.trigLeftP]
trigLeftR = arr[Button.trigLeftR]

start = arr[Button.start] 
startP = arr[Button.startP]
startR = arr[Button.startR]

select = arr[Button.select]
selectP = arr[Button.selectP]
selectR = arr[Button.selectR]
#endregion