/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player_main))
{
	target_x = obj_player_main.x;
	target_y = obj_player_main.y;
}

x += (target_x - x) / follow_speed;
y += (target_y - y) / follow_speed;

if(instance_exists(obj_decoy))
{
	if(point_distance(x,y,obj_decoy.x,obj_decoy.y) <= damage_radius)
	{
		obj_decoy.TakeDamage();
	}
}

if(instance_exists(_obj_player))
{
	if(point_distance(x,y,_obj_player.x,_obj_player.y) <= damage_radius)
	{
		_obj_player.TakeDamage();
	}
}