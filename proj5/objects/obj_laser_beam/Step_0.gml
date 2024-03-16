x = obj_player.x
y = obj_player.y


direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)

var max_length = 900

for (i = 0; i < max_length; i++ ) {

   xEnd = x + lengthdir_x(i, direction);
   yEnd = y + lengthdir_y(i, direction);
  
   length_laser = i;   // how long the laser is in the end
  
   // breaking point change here object to break to or add multiple breaking points
    if (collision_point(xEnd, yEnd, [obj_wall],0,1)) {

		break; // stops loop and sets new xEnd and yEnd values
    }
  
} 


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
