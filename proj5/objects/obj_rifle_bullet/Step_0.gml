event_inherited();
if _explosive{
	if (place_meeting(x+lengthdir_x(14,direction), y+lengthdir_y(14,direction), [obj_wall])) {
		instance_destroy();
		instance_create_layer(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),"Instances",obj_explosion);
	}
}
/*if (place_meeting(x, y, [oTracker, oTurret])) {
	instance_destroy();
}*/

/*
if (global.richochet) {
	show_debug_message(string(timer));
	if (timer > 0) {timer--;}

	if (timer == 0)
	{
	 instance_destroy();
	 timer = -1; // This is important, or the timer will trigger every step once it runs out
	}
	
	else {
			move_bounce_solid(true);
	}
}

else {
	if (place_meeting(x, y, [obj_wall])) {
		instance_destroy();
	}
}

//if (x > room_width) {
//    instance_destroy();
//}


