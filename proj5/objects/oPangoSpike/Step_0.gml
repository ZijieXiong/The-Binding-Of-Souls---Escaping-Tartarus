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
	sprite_index = Ice_VFX_1_In_Dirt;
	screenshake(10, 2, 0.2);
}