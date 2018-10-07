enum Color
{
	red1, //brightest (= purple1)
	red2,
	red3,
	red4, //dullest
	yellow1,
	yellow2,
	yellow3,
	yellow4,
	purple1,
	purple2,
	purple3,
	purple4,
	blue1,
	blue2,
	blue3,
	blue4,
	gray1, //=white
	gray2,
	gray3,
	gray4 
}
global.color = array_create(20);
global.color[0] = make_color_rgb(255,179,218);	//red1
global.color[1] = make_color_rgb(255,102,143);	//red2
global.color[2] = make_color_rgb(179,17,99);	//red3
global.color[3] = make_color_rgb(111,0,65);		//red4
global.color[4] = make_color_rgb(255,221,49);	//yellow1
global.color[5] = make_color_rgb(204,122,40);	//yellow2
global.color[6] = make_color_rgb(128,37,37);	//yellow3
global.color[7] = make_color_rgb(63,0,31);		//yellow4
global.color[8] = make_color_rgb(255,179,218);	//purple1
global.color[9] = make_color_rgb(191,105,177);	//purple2
global.color[10] = make_color_rgb(115,49,128);	//purple3
global.color[11] = make_color_rgb(37,9,63);		//purple4
global.color[12] = make_color_rgb(153,255,238);	//blue1
global.color[13] = make_color_rgb(56,169,191);	//blue2
global.color[14] = make_color_rgb(37,83,128);	//blue3
global.color[15] = make_color_rgb(9,19,63);		//blue4
global.color[16] = make_color_rgb(255,255,255);	//gray1
global.color[17] = make_color_rgb(191,191,191);	//gray2
global.color[18] = make_color_rgb(128,128,128);	//gray3
global.color[19] = make_color_rgb(63,63,63);	//gray4

global.color_count = array_length_1d(global.color);