enum Pal 
{
    grayscale,
    blue,
    purple,
    yellow,
    purple_blue,
    yellow_purple,
    blue_purple,
    purple_yellow,
    ice,
    red,
    yellow_red,
    purple_red
};

global.pal[0] = "grayscale";
global.pal[1] = "blue";
global.pal[2] = "purple";
global.pal[3] = "yellow";
global.pal[4] = "purple_blue";
global.pal[5] = "yellow_purple";
global.pal[6] = "blue_purple";
global.pal[7] = "purple_yellow";
global.pal[8] = "ice";
global.pal[9] = "red";
global.pal[10] = "yellow_red";
global.pal[11] = "purple_red";

global.palette_count = array_length_1d(global.pal);
