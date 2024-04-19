// Inherit the parent event
event_inherited();

is_jump = false;
target_x = 0;
target_y = 0;
jump_speed = 3;

max_jump_length = 150;

alert_radius = 500;
alarm[0]=120;

size_scale = 1.5;
image_xscale = size_scale;
image_yscale = size_scale;

get_new_location = function(_min_dist, _max_dist)
{
	var _target_x ;
	var _target_y ;
	
	do {
	var _distance = random_range(_min_dist, _max_dist);
	var _direction = random(360);
	_target_x = x + lengthdir_x(_distance, _direction);
	_target_y = y + lengthdir_y(_distance, _direction);
	} until (!place_meeting(_target_x, _target_y, obj_wall)) ;
	
	
	return [_target_x, _target_y];
}
