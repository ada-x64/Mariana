enum Btype
{
    unaimed,
    aimed,
    tracking,
    bomb,
    spiral,
    burst3,
    burst5,
    burst7,
    burst9,
    turret,
	wavy,
	sine,
	burst, //reflects bullets like Mariana's burst
	tendril, //a bunch of tracking bullets with a short end time and a 0 bfreq
	spear,
	wbbomb, //wavy bomb bomb
	sbbomb, //sine bomb bomb
	rings,  //bomb bomb
	sbomb, //sine bomb
	wbomb,  //wavy bomb
	sspiral, //sine spiral
	wspiral, //wavy spiral
    wburst3,
    wburst5,
    wburst7,
    wburst9,
    sburst3,
    sburst5,
    sburst7,
    sburst9,
    aburst3,
    aburst5,
    aburst7,
    aburst9,
    tburst3,
    tburst5,
    tburst7,
    tburst9,
	sturret,
	stracking,
	stendril,
	laser,
	radial,
	sradial,
	wradial
};

global.btype[0] = "unaimed";
global.btype[1] = "aimed";
global.btype[2] = "tracking";
global.btype[3] = "bomb";
global.btype[4] = "spiral";
global.btype[5] = "burst3";
global.btype[6] = "burst5";
global.btype[7] = "burst7";
global.btype[8] = "burst9";
global.btype[9] = "turret";
global.btype[10] = "wavy";
global.btype[11] = "sine";
global.btype[12] = "burst";
global.btype[13] = "tendril";
global.btype[14] = "spear";
global.btype[15] = "wbbomb";
global.btype[16] = "sbbomb";
global.btype[17] = "rings";
global.btype[18] = "sbomb";
global.btype[19] = "wbomb";
global.btype[20] = "sspiral";
global.btype[21] = "wspiral";
global.btype[22] = "wburst3";
global.btype[23] = "wburst5";
global.btype[24] = "wburst7";
global.btype[25] = "wburst9";
global.btype[26] = "sburst3";
global.btype[27] = "sburst5";
global.btype[28] = "sburst7";
global.btype[29] = "sburst9";
global.btype[30] = "aburst3";
global.btype[31] = "aburst5";
global.btype[32] = "aburst7";
global.btype[33] = "aburst9";
global.btype[34] = "tburst3";
global.btype[35] = "tburst5";
global.btype[36] = "tburst7";
global.btype[37] = "tburst9";
global.btype[38] = "sturret";
global.btype[39] = "stracking";
global.btype[40] = "stendril";
global.btype[41] = "laser";
global.btype[42] = "radial";
global.btype[43] = "sradial";
global.btype[44] = "wradial";

global.btype_count = array_length_1d(global.btype);
