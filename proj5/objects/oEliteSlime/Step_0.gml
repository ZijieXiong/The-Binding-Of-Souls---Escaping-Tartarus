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
	var _collision_res = collision_rectangle(x + -alert_radius, y + -alert_radius, x + alert_radius, y + alert_radius, obj_player, true, 1);
	if(_collision_res)
		screenshake(10, 3, 0.2);
		
	shoot(toggle_shoot);
	toggle_shoot = !toggle_shoot;
}


if(_health <= 0){
	
	show_debug_message("Mega Slime died!");
	
	var _target_loc = get_new_location(10, 30);

	instance_create_layer(_target_loc[0], _target_loc[1], "Instances", oMegaSlime);
	
	_target_loc = get_new_location(10, 30);
	
	instance_create_layer(_target_loc[0], _target_loc[1], "Instances", oMegaSlime);
	
}

//show_debug_message("666");