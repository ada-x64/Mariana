///@function spawnBullet(x [real], y [real], z [real], spd [real], dir [real degrees], curve [real degrees], type [enum], spawner [name], lifespan [real beats])
///@param {real} x
///@param {real} y
///@param {real} z
///@param {real} spd
///@param {degrees} dir
///@param {degrees} curve
///@param {enum} type
///@param {name} spawner
///@param {real} lifespan

var arr;

for (var i=0; i<=8; i++)
{
    arr[i] = argument[i]; //set parametered bullet arguments
}
arr[2] = false;
arr[9] = 0; //timer = 0;

ds_list_add(global.bullet_list,arr);
