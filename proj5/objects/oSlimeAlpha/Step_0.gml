

if(_health <= 0){
	
	show_debug_message(" Slime died!");
	
	if (slime_size>1)
	{
		slime_size -= 1;
		_health = 10 * slime_size;
		instance_copy(true);
		
	} else
	{
		instance_destroy();
	}

	
}

var alert_radius = 150;

var collision_res = collision_rectangle(x + -alert_radius, y + -alert_radius, x + alert_radius, y + alert_radius, obj_player, true, 1);
if(collision_res)
{
	speed = 1;

	direction = point_direction(x, y, obj_player.x, obj_player.y);
}

else
{
	speed = 1;

	direction += 2;
}

//show_debug_message("666");