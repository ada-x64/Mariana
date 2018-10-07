enum Etype
{
    dummy,
    pills,
    eye,
    monitor,
    heart,
    heart_left,
    heart_right,
    hourglass,
	popcorn
};

global.etype[0] = "dummy";
global.etype[1] = "pills";
global.etype[2] = "eye";
global.etype[3] = "monitor";
global.etype[4] = "heart";
global.etype[5] = "heart_left";
global.etype[6] = "heart_right";
global.etype[7] = "hourglass";
global.etype[8] = "popcorn";

global.etype_count = array_length_1d(global.etype);

ENUM_BARR();