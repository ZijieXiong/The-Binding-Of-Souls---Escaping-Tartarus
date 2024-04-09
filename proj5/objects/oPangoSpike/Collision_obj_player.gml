/// @description Insert description here
// You can write your code in this editor
if(!is_ground && point_distance(x, y, target_x, target_y)<5)
{
	with(other)
	{	
		TakeDamage();
	}
}