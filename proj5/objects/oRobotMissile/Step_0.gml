/// @description Insert description here
// You can write your code in this editor

/*
if(instance_exists(obj_target) && point_direction(x, y, obj_target.x, obj_target.y)<5)
{
	explode();
	with(obj_target)
	{
		instance_destroy();
	}
}*/

if((sprite_index == sprite_explode) && (image_index >= (sprite_get_number(sprite_index) - 1))){
		instance_destroy()
}