

if (global.richochet) {
	var temp_direction = direction
	move_bounce_solid(true);

	if temp_direction != direction {
		show_debug_message(_bouncesLeft)
		image_angle = direction
		_bouncesLeft -=1;
	}

	if(_bouncesLeft < 0){
		instance_destroy();
	}
	

}
else {
	if (place_meeting(x, y, [obj_wall])) {
		instance_destroy();
	}
}

