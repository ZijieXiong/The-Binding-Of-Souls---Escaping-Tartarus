/// @description Insert description here
// You can write your code in this editor

if(!is_ground && point_distance(x, y, target_x, target_y)<1)
{
	speed = 0;
	is_ground = true;
	image_speed = 0;
	image_index = 0;
	alarm[1] = life_time * 60;
	solid = true;
}