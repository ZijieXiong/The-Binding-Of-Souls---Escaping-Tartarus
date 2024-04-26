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
	alarm[0] = random_range(50, 70);
	sprite_index = spr_slime_idle;
	image_speed = 1;
}


if(_health <= 0){
	
	//show_debug_message("Mega Slime died!");
	alarm[0] = -1;
	
	var _target_loc = get_new_location(10, 30);

	var _inst1= instance_create_layer(_target_loc[0], _target_loc[1], "Instances", oSlime);
	_inst1._currentRoom = _currentRoom;
	
	_target_loc = get_new_location(10, 30);
	
	var _inst2 = instance_create_layer(_target_loc[0], _target_loc[1], "Instances", oSlime);
	_inst2._currentRoom = _currentRoom;
}

//show_debug_message("666");