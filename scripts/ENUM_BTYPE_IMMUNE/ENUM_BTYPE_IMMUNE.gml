enum Btype_i
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
	stendril
};

global.btype_i[0] = "unaimed_i";
global.btype_i[1] = "aimed_i";
global.btype_i[2] = "tracking_i";
global.btype_i[3] = "bomb_i";
global.btype_i[4] = "spiral_i";
global.btype_i[5] = "burst3_i";
global.btype_i[6] = "burst5_i";
global.btype_i[7] = "burst7_i";
global.btype_i[8] = "burst9_i";
global.btype_i[9] = "turret_i";
global.btype_i[10] = "wavy_i";
global.btype_i[11] = "sine_i";
global.btype_i[12] = "burst_i";
global.btype_i[13] = "tendril_i";
global.btype_i[14] = "spear_i";
global.btype_i[15] = "wbbomb_i";
global.btype_i[16] = "sbbomb_i";
global.btype_i[17] = "rings_i";
global.btype_i[18] = "sbomb_i";
global.btype_i[19] = "wbomb_i";
global.btype_i[20] = "sspiral_i";
global.btype_i[21] = "wspiral_i";
global.btype_i[22] = "wburst3_i";
global.btype_i[23] = "wburst5_i";
global.btype_i[24] = "wburst7_i";
global.btype_i[25] = "wburst9_i";
global.btype_i[26] = "sburst3_i";
global.btype_i[27] = "sburst5_i";
global.btype_i[28] = "sburst7_i";
global.btype_i[29] = "sburst9_i";
global.btype_i[30] = "aburst3_i";
global.btype_i[31] = "aburst5_i";
global.btype_i[32] = "aburst7_i";
global.btype_i[33] = "aburst9_i";
global.btype_i[34] = "tburst3_i";
global.btype_i[35] = "tburst5_i";
global.btype_i[36] = "tburst7_i";
global.btype_i[37] = "tburst9_i";
global.btype_i[38] = "sturret_i";
global.btype_i[39] = "stracking_i";
global.btype_i[40] = "stendril_i";

global.btype_count_i = array_length_1d(global.btype_i);
