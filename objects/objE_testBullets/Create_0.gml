is_hurt = false;
barr = enemy_init_bullets(0,0,0,0,0,0,0);
type = 0;
spd = 1;
dir = 0;
curve = 0;
freq = 1;
lifespan = 1;
immune = false;

x = room_width/2;
y = room_height/2;

if !instance_exists(BULLET_MANAGER) {instance_create_layer(x,y,global.terminal_layer,BULLET_MANAGER);}