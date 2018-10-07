///set level
switch (room)
{
    case rm_test:
    {
        global.level = Level.test//Level.test;
		global.level_pal = Pal.ice;
		instance_create_layer(0,0,global.player_layer,objM);
		instance_create_layer(0,0,global.terminal_layer,LEVEL_RUNNER);
		if !instance_exists(BULLET_MANAGER) {instance_create_layer(0,0,global.bullet_layer,BULLET_MANAGER)}
		global.enemies_killed = 0;
		score = 0;
        break;
    }
    case rm_boot:
    {
        global.level = Level.boot;
        break;
    }
    default:
    {
        global.level = Level.none;
        break;
    }
}
    
//perform checks to see what progress has been made through the game
//check to see if the player has e.g. selected a level
//etc.

//if we need to make specific instances during certain levels, we can do this here
//though that seems unlikely
/*
switch (global.level)
{
    case Level.test:
    {
        break;
    }
}

/* */
/*  */
