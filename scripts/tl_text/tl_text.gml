show_debug_message("Initiating textbox sequence!")
with objM
{
	switch(argument0) //determine portrait
	{
		case ("Mariana"): case("mariana"): case("M"):
		{
			port = spr_port_mariana_talking;
			port_image_speed = 16/fps;
			break;
		}
		case ("Mariana thought"): case("mariana thought"): case("M thought"):
		{
			port = spr_port_mariana;
			port_image_speed = 10/fps;
			break;
		}
	}
	
	text = "";
	full_text = argument1; //what is to be said
	show_debug_message("\""+full_text+"\"")
	show_debug_message("timer="+string(talk_timer)+"\ntime="+string(talk_time));
	talk_timer = 0;
	talk_time = argument2*global.bps*global.T; //how long the message should be up
	show_debug_message("timer="+string(talk_timer)+"\ntime="+string(talk_time));
	talkbox_font = fnt_talkbox;
}