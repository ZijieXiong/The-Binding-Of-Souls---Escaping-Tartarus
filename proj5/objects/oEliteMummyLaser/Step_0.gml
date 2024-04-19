/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player))
{
	target_x = obj_player.x;
	target_y = obj_player.y;
}

x += (target_x - x) / follow_speed;
y += (target_y - y) / follow_speed;

if(instance_exists(obj_player))
{
	if(point_distance(x,y,obj_player.x,obj_player.y) <= damage_radius)
	{
		obj_player.TakeDamage();
	}
}