

if mouse_check_button(mb_left){
	if (current_duration < max_duration) && (current_overheat == -1) {
		if !(instance_exists(obj_laser_beam)){
			instance_create_layer(mouse_x , mouse_y, "Instances",obj_laser_beam  );
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
