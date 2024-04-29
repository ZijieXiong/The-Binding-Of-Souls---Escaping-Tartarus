if (place_meeting(x, y, [obj_player_main, obj_wall])) {
	instance_destroy();
}


var _target_dir = point_direction(x, y, obj_player_main.x, obj_player_main.y);
		
var _angle_difference = angle_difference(_target_dir, direction);
if (abs(_angle_difference) < 1) {
	// Close enough to directly set the direction
	direction = _target_dir;
} else {
	// Rotate towards the target_direction by turn_speed
	if (_angle_difference > 0) {
		direction += 1;
	} else {
		direction -= 1;
	}
}