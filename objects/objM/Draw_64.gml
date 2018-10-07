#region surface cam
draw_GUI_surf_cam_start();
#region vars
var sWidth = sprite_get_width(spr_hud_bars);
var sHeight = sprite_get_height(spr_hud_bars);
var xx = surface_get_width(surface)/2;
var yy = surface_get_height(surface)/2;
#endregion vars
#region self
if !is_dead
{
var marPal, alpha;
if (hp_is_invincible || ishurt)
    {marPal = Pal.red; alpha = 0.5;}
else if (mp_penalty)
	{marPal = Pal.yellow_red; alpha = 1;}
else {marPal = Pal.purple_blue; alpha = 1;}

if dash {sprite_index = sprM_dash;
		image_index  = image_number*6*dash_timer/fps;}
else	{sprite_index = sprM; image_index = 0;}

spr_rot = -dir - 90;

var xx = surface_get_width(surface)/2;
var yy = surface_get_height(surface)/2;

draw_set_alpha(alpha);
if !hp_is_invincible var cond = true;
else var cond = current_time % 2 == 0;
if cond
	draw_sprite_palette_ext(sprite_index,image_index,xx,yy,1,1,spr_rot,c_white,1,marPal);    
draw_set_alpha(1);
}

if mp == 1 {mp_cooldown = false;}
else {mp_cooldown = true;}
if hp == 1 {hp_cooldown = false;}
else {hp_cooldown = true;}

if mp_cooldown
{
	if round(current_time) % 2 == 0
		draw_sprite_ext(sprM_bar,0,xx+lengthdir_x(9,dir-90),yy-lengthdir_y(9,dir-90),1,1,spr_rot+90,c_white,1-mp);
}
if hp_cooldown
{
	if round(current_time) % 2 == 0
		draw_sprite_ext(sprM_bar,1,xx-lengthdir_x(9,dir-90),yy+lengthdir_y(9,dir-90),1,1,spr_rot+90,c_white,1.25-hp);
}

#endregion self
draw_GUI_surf_cam_end();
#endregion surface cam

#region dead
if is_dead
{
	var death_time = 3*fps;
	if death_timer > death_time/3
	{
		//dir = darctan2(global.playarea_midy-y,global.playarea_midx-x);
		draw_set_palette(Pal.purple_blue);
		sprite_index = sprM_dash;
		image_index += 8/fps;
		var lx = -lengthdir_x(600-600*death_timer/death_time,dir);
		var ly = -lengthdir_y(600-600*death_timer/death_time,dir);
		if current_time % 2 == 0
			draw_sprite_ext(sprite_index,image_index,x+lx,y+ly,death_timer/death_time,death_timer/death_time,dir-90,c_white,0.75);
		draw_reset_palette();
	}
}
#endregion dead

#region particles
if dash
{
	part_type_life(global.pt[PT.trail],30,30);
	part_type_alpha2(global.pt[PT.trail],0.25,0.125);
	part_type_size(global.pt[1],8,8,-0.25,0);
	part_particles_create(global.ps_player,x-4,y-4,global.pt[PT.trail],1);
}
else if xspd != 0 or yspd != 0
{
	part_type_life(global.pt[PT.trail],15,15);
	part_type_alpha2(global.pt[1],0.25,0.125);
	part_type_size(global.pt[1],4,4,-0.25,0);
	part_particles_create(global.ps_player,x-2,y-2,global.pt[PT.trail],1);
}

if !DEV_TERMINAL.is_open and !global.paused and !global.unfocused
	part_timer_special ++;
if mp >= 1 and part_timer_special > 25
{
	part_timer_special = 0;
	part_particles_create(global.ps_player,x,y,global.pt[PT.special_ready],1);
}
#endregion particles

#region catch bubble
if mp_state == 1 and current_time mod 2 == 0
{
	draw_sprite_ext(sprM_shield,(1-mp)*sprite_get_number(sprM_shield),x,y,1,1,mp_dir+90,c_white,0.75)
}
if !gamepad_is_connected(0)
{
	draw_sprite(spr_console_cursor,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
}
#region old
/*
if !surface_exists(surface_mp)
	surface_mp = surface_create(64,64);
surface_set_target(surface_mp)
draw_clear_alpha(c_white,0)
if (mp_state == 1)
{
	var sinetime = (current_time/150)
	alpha = min(0.75*abs(sin(sinetime/2))*mp,0.15)
	var r = 12 + 8*mp + 0.5*sin(sinetime)
	draw_set_alpha(0.5*mp + 0.15)
	draw_circle_colour(surface_get_width(surface)/2,surface_get_height(surface)/2,r,c_white,c_white,0);
	draw_set_alpha(alpha)
	draw_circle_colour(surface_get_width(surface)/2,surface_get_height(surface)/2,r,make_colour_hsv(235,25,50),c_white,0)
	draw_set_alpha(1)
}
surface_reset_target();
if surface_exists(surface_mp)
	draw_surface(surface_mp,x-33,y-32);*/
#endregion old
#endregion catch bubble

#region hud
#region sidebars
//solid bars
draw_set_alpha(0.35)
draw_set_colour(c_dkgray);
draw_rectangle(0,                      0, (INITIALIZER.ideal_width/2)-(4/6)*INITIALIZER.ideal_height, display_get_gui_height(),0)
draw_rectangle(display_get_gui_width(),0, (INITIALIZER.ideal_width/2)+(4/6)*INITIALIZER.ideal_height, display_get_gui_height(),0)
draw_set_alpha(1);
/*gradient bars*/
gpu_set_blendmode(bm_subtract);
draw_rectangle_colour(0                      ,0,(INITIALIZER.ideal_width/2)-(4/6)*INITIALIZER.ideal_height + 32,display_get_gui_height(),c_white,c_black,c_black,c_white,0);
draw_rectangle_colour(display_get_gui_width(),0,(INITIALIZER.ideal_width/2)+(4/6)*INITIALIZER.ideal_height - 32,display_get_gui_height(),c_black,c_white,c_white,c_black,0);
gpu_set_blendmode(bm_normal)
//text on the sidelines
draw_set_font(fnt_hud);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var xx = 8;
var yy = 8;
var hh = string_height("A");
var ww = (INITIALIZER.ideal_width/2)-(4/6)*INITIALIZER.ideal_height - 16;
draw_text(xx,yy+hh*0,"-KILLS-")
var str = string(global.enemies_killed);
while (string_width(str) < ww-string_width("A"))
{
	str = "0"+str;
}
draw_text(xx,yy+hh*1,str);
draw_text(xx,yy+hh*3,"-LIVES-")
var str = string(lives_left);
while (string_width(str) < ww-string_width("A"))
{
	str = "0"+str;
}
draw_text(xx,yy+hh*4,str);

draw_text(xx,yy+hh*6,"-SCORE-")
if score < 0 {score = 0;}
var str = string(score);
while (string_width(str) < ww-string_width("A"))
{
	str = "0"+str;
}
draw_text(xx,yy+hh*7,str);

xx = (INITIALIZER.ideal_width/2)-(4/6)*INITIALIZER.ideal_height - 72;
yy = display_get_gui_height()-65;

draw_sprite(spr_hud_specials,mp_special,xx,yy)
xx = 8;
yy -= 12;
var str = string(mp_specials_left);
while (string_width(str) < ww-string_width("A"))
{
	str = "0"+str;
}
draw_text(xx,yy-string_height("A"),"SPECIAL")
draw_text(xx,yy,str);

#endregion
#region hp/mp display
var xx = display_get_gui_width() - 40; // 80 = (640*3/4)/2
var yy = display_get_gui_height() - 41 + 8;
draw_sprite(spr_hud_heart,0,xx,yy);
#region hp
draw_set_colour(c_white);
draw_set_alpha(1);
draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_hud_bars,0));
{
    var hpstat = -1;
    if (hp>=3/4) {var hpstat = 1;}
    else if (hp>=2/4 && hp <3/4) {var hpstat = 2;}
    else if (hp>=1/4 && hp <2/4) {var hpstat = 3;}
    else if (hp>=0/4 && hp <1/4) {var hpstat = 4;}
    
    //vars multiplier(x/y)_topright, m(x/y)_topleft, m(x/y)_centerleft, m(x/y)Texture_(tr,tl,cl)
    var mx_tr=0, my_tr=0, mx_tl=0, my_tl=0, mx_cl=0, my_cl=0, mx_bl=0, my_bl=0;
    if (hpstat == 1)
        {
        mx_tr = (4/1)*(1-hp);
        my_tr = 0;
        }
    else if (hpstat == 2)
        {
        mx_tr = 1;
        my_tr = (4/2)*(3/4-hp); 
        mx_tl = 0;
        my_tl = (4/2)*(3/4-hp);
        }
    else if (hpstat == 3)
        {
        mx_tr = (1);
        my_tr = 0.5 + (4/2)*(2/4-hp);
        mx_tl = (0);
        my_tl = 0.5 + (4/2)*(2/4-hp);
        mx_cl = (0);
        my_cl = (4/2)*(2/4-hp);
        }
    else if (hpstat == 4)
        {
        mx_tr = (1 - 0.5*4*(1/4-hp));
        my_tr = 1;
        mx_tl = 0.5*4*(1/4-hp);
        my_tl = 1;
        mx_cl = 0.5*4*(1/4-hp); 
        my_cl = 0.5;
        mx_bl = 0.5*4*(1/4-hp);
        my_bl = 0;
        }
	//xx+=16; yy+=23;
    draw_vertex_texture(xx,yy,1,1/2); //center right
    draw_vertex_texture(xx,yy+sHeight/2,1,1); //bottom right
    draw_vertex_texture(xx,yy,1,1/2); //center right
    draw_vertex_texture(xx-sWidth+(sWidth*mx_bl),yy+sHeight/2,0+mx_bl,1); //bottom left
    draw_vertex_texture(xx-sWidth+(sWidth*mx_cl),yy+(sHeight*my_cl),0+mx_cl,1/2+my_cl); //* center left *
    draw_vertex_texture(xx,yy,1,1/2); //center right
    draw_vertex_texture(xx-sWidth+(sWidth*mx_tl),yy-sHeight/2+(sHeight*my_tl),0+mx_tl,0+my_tl); //* top left *
    draw_vertex_texture(xx-(sWidth*mx_tr),yy-sHeight/2+(sHeight*my_tr),1-mx_tr,0+my_tr); //* top right *
    draw_vertex_texture(xx,yy,1,1/2); //center right
	//xx-=16; yy-=23;
}
draw_primitive_end();
//draw_reset_palette();
#endregion hp
#region mp
//draw_set_palette(mpPal);
var subimg = 1;
if mp <=0.5 {subimg = 2;}
if mp_penalty {subimg = 3;}
draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_hud_bars,subimg));
{
    var mpstat = -1;
    if (mp>=3/4) {var mpstat = 1;}
    else if (mp>=2/4 && mp <3/4) {var mpstat = 2;}
    else if (mp>=1/4 && mp <2/4) {var mpstat = 3;}
    else if (mp>=0/4 && mp <1/4) {var mpstat = 4;}
    
    //vars multiplier(x/y)_topright, m(x/y)_topleft, m(x/y)_centerleft, m(x/y)Texture_(tr,tl,cl)
    var mx_tl=0, my_tl=0, mx_tr=0, my_tr=0, mx_cr=0, my_cr=0, mx_br=0, my_br=0;
    if (mpstat == 1)
        {
        mx_tl = (4/1)*(1-mp);
        my_tl = 0;
        }
    else if (mpstat == 2)
        {
        mx_tl = 1;
        my_tl = (4/2)*(3/4-mp); 
        mx_tr = 0;
        my_tr = (4/2)*(3/4-mp);
        }
    else if (mpstat == 3)
        {
        mx_tl = (1);
        my_tl = 0.5 + (4/2)*(2/4-mp);
        mx_tr = (0);
        my_tr = 0.5 + (4/2)*(2/4-mp);
        mx_cr = (0);
        my_cr = (4/2)*(2/4-mp);
        }
    else if (mpstat == 4)
        {
        mx_tl = (1 - 0.5*4*(1/4-mp));
        my_tl = 1;
        mx_tr = 0.5*4*(1/4-mp);
        my_tr = 1;
        mx_cr = 0.5*4*(1/4-mp); 
        my_cr = 0.5;
        mx_br = 0.5*4*(1/4-mp);
        my_br = 0;
        }
	//xx+=16; yy+=23;
    draw_vertex_texture_colour(xx,yy,0,1/2,c_white,1); //center left
    draw_vertex_texture_colour(xx,yy+sHeight/2,0,1,c_white,1); //bottom left
    draw_vertex_texture_colour(xx,yy,0,1/2,c_white,1); //center left
    draw_vertex_texture_colour(xx+sWidth-(sWidth*mx_br),yy+sHeight/2,1-mx_br,1,c_white,1); //* bottom right *
    draw_vertex_texture_colour(xx+sWidth-(sHeight*mx_cr),yy+(sHeight*my_cr),1-mx_cr,1/2+my_cr,c_white,1); // * center right *
    draw_vertex_texture_colour(xx,yy,0,1/2,c_white,1); //center left
    draw_vertex_texture_colour(xx+sWidth-(sWidth*mx_tr),yy-sHeight/2+(sHeight*my_tr),1-mx_tr,0+my_tr,c_white,1); //* top right *
    draw_vertex_texture_colour(xx+(sWidth*mx_tl),yy-sHeight/2+(sHeight*my_tl),0+mx_tl,0+my_tl,c_white,1); //* top left *
    draw_vertex_texture_colour(xx,yy,0,1/2,c_white,1); //center left
	//xx-=16; yy-=23;
}
draw_primitive_end();
//draw_reset_palette();
#endregion mp
#region specials
//draw_sprite_palette(sprM_burst_bar,sprite_get_number(sprM_burst_bar)-1-mp_specials_left,xx-6,yy+sprite_get_height(spr_hud_bars)/2,Pal.purple);
#endregion specials
#endregion hp/mp display
#region talkbox
#region the box
xx = display_get_gui_width()/2 - sprite_get_width(spr_talkbox)/2;
yy = display_get_gui_height() - sprite_get_height(spr_talkbox) - 1;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(xx,yy,xx+sprite_get_width(spr_talkbox),yy+sprite_get_height(spr_talkbox),0);
draw_set_alpha(1);
draw_set_color(c_white);
if !(DEV_TERMINAL.is_open or global.unfocused or global.paused) 
	{port_image_index += port_image_speed;}
if port_image_index > sprite_get_number(port) {port_img_index = 0;}
draw_sprite(port,port_image_index,xx + 4, yy);
draw_sprite(spr_talkbox,0,xx,yy)
#endregion
#region text
#region set up
//surface
surface_set_target(surf_text);
draw_clear_alpha(c_black,0);
//draw settings
draw_set_font(talkbox_font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//positions
var xx = display_get_gui_width()/2 - sprite_get_width(spr_talkbox)/2 + 64 + 8;
var yy = display_get_gui_height() - sprite_get_height(spr_talkbox) + 3;
var ww = display_get_gui_width()/2 + sprite_get_width(spr_talkbox)/2 - xx
var hh = display_get_gui_height() - yy;
var x1 = 0;
var y1 = 0;
#endregion set up
if talk_time !=0 //update text
{
	if !(DEV_TERMINAL.is_open or global.unfocused or global.paused) 
	{
		#region add line breaks
		var p = string_pos("\n",text);
		for ( var i =0; i <= text_pos-p; i++)
		{
			var str = string_copy(text,p,p+i);
			var k = 0;
			while p != 0 and p!=1
			{
				str = string_copy(str,p,p+k);
				p = string_pos("\n",str);
				k++;
			}
			if string_width(str) >= ww
			{
				k = text_pos;
				while (string_char_at(text,k) != " ")
					{k--;}
				text = string_insert("\n",text,k+1);
				text_bold = string_insert("\n",text_bold,k+1);
				text_italic = string_insert("\n",text_italic,k+1);
				break;
			}
			else
				i++;
		}
		#endregion line breaks
		#region scoot it down
		if string_width(text) > ww*hh or string_count("\n",text) > 2
		{
			var i = string_pos("\n",text);
			text = string_delete(text,1,i);
			text_bold = string_delete(text_bold,1,i);
			text_italic = string_delete(text_italic,1,i);
			//full_text = string_delete(full_text,1,i);
		}
		#endregion scoot scoot
		#region main -- add to text
		if !text_wait
		{
			talk_timer += global.bps*global.T/60 + (delta_time) / 1000000;
			if talk_timer >= talk_time {talk_time = 0;}
			if (round(current_time) % 2 == 0)
				{
					text_pos ++;
					#region character switch
					switch string_char_at(full_text,text_pos)
					{
						case ("_"):
						{
							text += " ";
							text_bold += " ";
							text_italic += " ";
							break;
						}
						#region special characters
						case("\\"):
						{
							text_pos++;
							switch string_char_at(full_text,text_pos)
							{
								case("c"): case("C"):
								{
									text += ",";
									text_italic += ",";
									text_bold += ",";
									break;
								}
								case("r"): case("R"):
								{
									talkbox_font = fnt_talkbox; break;
								}
								case("b"): case("B"):
								{
									talkbox_font = fnt_talkbox_bold; break;
								}
								case("i"): case("I"):
								{
									talkbox_font = fnt_talkbox_italic; break;
								}
								case("n"): case("N"):
								{
									text += "\n";
									text_bold += "\n";
									text_italic+="\n";
									text_wait = true;
									text_wait_time = 15;
									break;
								}
								case("\""):
								{
									text += "\"";
									text_bold += "\"";
									text_italic+="\"";
									text_wait = true;
									break;
								}
								case("w"):
								{
									text_wait = true;
									text_wait_time = 15;
									break;
								}
								case("W"):
								{
									text_wait = true;
									text_wait_time = 30;
									break;
								}
								default:
								{
									text += "\\"; text_pos --;
								}
							}
							break;
						}
						#endregion special chars
						#region default
						case "":
						{break;}
						default:
						{
							play_sfx(textbox_sfx,0,1,choose(1.2,1.4,1.6));
							switch (talkbox_font)
							{
								case fnt_talkbox:
								{
									text += string_char_at(full_text,text_pos);
									text_italic += " ";
									text_bold += " ";
									break;
								}
								case fnt_talkbox_bold:
								{
									text_bold += string_char_at(full_text,text_pos); 
									text += " ";
									text_italic += " ";
									break;
								}
								case fnt_talkbox_italic:
								{
									text_italic += string_char_at(full_text,text_pos); 
									text += " ";
									text_bold += " ";
									break;
								}
							}
							break;
						}
						#endregion
					}
					#endregion
				}
		}
		else
		{
			text_wait_timer ++;
			if text_wait_timer > text_wait_time
				{text_wait = false; text_wait_timer = 0;}
		}
		#endregion main
		#region finish up
		if text_pos >= string_length(full_text)
		{
			switch (port)
			{
				case (spr_port_mariana_talking):
				{
					port = spr_port_mariana;
					port_image_speed = 10/fps;
					break;
				}
			}
		}
		#endregion finish up
	}
}
else #region reset text
{
	text = "";
	text_italic = "";
	text_bold = "";
	full_text = "";
	text_pos = 0;
	talk_timer = 0;
} #endregion reset
#region draw things
draw_set_font(fnt_talkbox);
draw_text(x1,y1,text);
draw_set_font(fnt_talkbox_bold);
draw_text(x1,y1,text_bold);
draw_set_font(fnt_talkbox_italic);
draw_text(x1,y1,text_italic);

surface_reset_target();
if !surface_exists(surf_text) {surf_text = surface_create(ww,hh);}
else draw_surface(surf_text,xx,yy);
#endregion draw things
#endregion text
#endregion talkbox
#endregion hud

/*
#region debug
draw_set_font(fnt_debug);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(display_get_gui_width(),0,"autoaim = "+string(global.autoaim*100)+"%")
#endregion debug