enum Level {
    none,
    test,
    boot,
	enemy_test,
	retrowave_test_level,
	boss_test
};

global.levelArr[0] = "none";
global.levelArr[1] = "test";
global.levelArr[2] = "boot";
global.levelArr[3] = "enemy_test";
global.levelArr[4] = "retrowave_test_level";
global.levelArr[5] = "boss_test";
global.level_count = array_length_1d(global.levelArr);