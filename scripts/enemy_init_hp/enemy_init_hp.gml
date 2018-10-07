///@func enemy_init_hp(max hp)
///@param max_hp
hp = round(argument0);
is_hurt = false;
hurt_timer = 0;
hx = 0;
hy = 0;
hparr = array_create(5);
hparr[0] = hp;
hparr[1] = is_hurt;
hparr[2] = hurt_timer;
hparr[3] = hx;
hparr[4] = hy;
max_hp = hp;