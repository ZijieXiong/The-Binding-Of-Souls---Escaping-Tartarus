/// @description Insert description here
// You can write your code in this editor
target_x = 0;
target_y = 0;

//obj_target = pointer_null;

//is_ground = false;

sprite_explode = spr_blue_explosion;

alarm[0] = -1;

explode = function()
{
	sprite_index = sprite_explode;
	speed = 0;
	image_speed = 0.5;
	image_index = 0;
	screenshake(0.8, 5, 0.2);

}