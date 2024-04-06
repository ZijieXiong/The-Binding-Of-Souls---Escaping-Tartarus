// Inherit the parent event
event_inherited();

//State execution
if(is_jump)
{
	speed = jump_speed;
	direction = point_direction(x, y, target_x, target_y);
	
} else {
	speed = 0;
}


//Update state
if(is_jump && point_distance(x, y, target_x, target_y)<5)
{
	speed = 0;
	is_jump = false;
	alarm[0] = 60;
	sprite_index = spr_slime_idle;
	image_speed = 1;
}


if(_health <= 0){
	
	show_debug_message("Mega Slime died!");
	
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

//show_debug_message("666");