x = obj_player.x;
y = obj_player.y;
direction = point_direction(x,y,mouse_x,mouse_y);

if (direction > 90) && (direction < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;
depth = obj_player.depth-1;

if mouse_check_button(mb_left){
	if (current_duration < max_duration) && (current_overheat == -1) {
		if (!instance_exists(obj_laser_beam)){
			instance_create_layer(x+lengthdir_x(64,direction),y+lengthdir_y(64,direction), "Instances",obj_laser_beam  );
		}
		current_duration+=1
	}else{
		show_debug_message("overheat")
		instance_destroy(obj_laser_beam);
		current_overheat = overheat_time
		current_duration = 0
	}

}

if !mouse_check_button(mb_left) { 
	instance_destroy(obj_laser_beam);
	current_duration = max(0,current_duration-1)
	}
if current_overheat >-1 {
	
	current_overheat -= 1
}
