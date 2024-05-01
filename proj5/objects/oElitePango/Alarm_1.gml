/// @description trail particle generation
// You can write your code in this editor

var _amount = random_range(1, 5);

repeat (_amount) {
var _len = 30;
var _angle_diff = random_range(-30, 30);

var _x = x + lengthdir_x(_len, direction-180 + _angle_diff);
var _y = y + lengthdir_y(_len, direction-180 + _angle_diff);
//_x = x;
//_y = y;

part_type_orientation(particleType_trail, direction, direction, 0, 0, 0);

part_particles_create(particleSystem, _x, _y, particleType_trail, 1);
}

var _loop = random_range(3,6);

if(is_trail)
	alarm_set(1, _loop);
