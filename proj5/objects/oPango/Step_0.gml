/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (current_state) {
    case PANGO_STATE.IDLE:
        //Idle
		//show_debug_message("Pango Idle");
		if(idle_timer_flag)
		{
			current_state = PANGO_STATE.WALK;
			idle_timer_flag = false;
			sprite_index = Spr_Walk;
			image_index = 0;
			//var _target_loc = get_new_location(50, 100);
			//target_x = _target_loc[0];
			//target_y = _target_loc[1];
			get_new_location(50, 100);
			speed = walk_speed;
			direction = point_direction(x, y, target_x, target_y);
		}
        break;
        
    case PANGO_STATE.WALK:
        // Handle walk behavior, including transitions to IDLE or PREROLL
		//show_debug_message("Pango Walk");
		if(point_distance(x, y, target_x, target_y)<15)
		{
			if(random(10) >= 5)
			{
				current_state = PANGO_STATE.TRACK;
				sprite_index = Spr_Track;
				image_index = 0;
				speed = 0;
				alarm[0] = 60 * 2;
			} else
			{
				current_state = PANGO_STATE.IDLE;
				sprite_index = Spr_Idle;
				image_index = 0;
				speed = 0;
				alarm[0] = 60*random_range(2, 5);
			}
			
		}
        break;
	
	case PANGO_STATE.TRACK:
		show_debug_message("Pango Track");
		if(idle_timer_flag)
		{
			current_state = PANGO_STATE.IDLE;
			idle_timer_flag = false;
			sprite_index = Spr_Idle;
			image_index = 0;
			speed = 0;
			alarm[0] = 60*random_range(2, 5);
			
		}
        break;
        
    case PANGO_STATE.PREROLL:
        // Initiate preroll setup and animation\
		if(idle_timer_flag)
		{
			current_state = PANGO_STATE.ROLL;
			idle_timer_flag = false;
			sprite_index = spr_rolling;
			speed = roll_speed;
			alarm[0] = 60 * roll_time;
			direction = point_direction(x, y, obj_player.x, obj_player.y);
			
		}
        
        break;
        
    case PANGO_STATE.ROLL:
        // Execute rolling behavior towards the player
        
		var _target_dir = point_direction(x, y, obj_player.x, obj_player.y);
		
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
		
		if(idle_timer_flag)
		{
			current_state = PANGO_STATE.STOPROLL;
			idle_timer_flag = false;
			sprite_index = Spr_Stop_Roll;
			image_index = 0;
			speed = 0;
			alarm[0] = 60 * stoproll_time;
			
		}
        break;
        
    case PANGO_STATE.STOPROLL:
        // Handle stoproll animation or effects
		if(idle_timer_flag)
		{
			current_state = PANGO_STATE.REST;
			idle_timer_flag = false;
			sprite_index = Spr_Idle;
			image_index = 0;
			speed = 0;
			alarm[0] = 60 * rest_time;
			//look_at_player(obj_player.x);
			if(x-obj_player.x >0)
			{
				image_xscale = -size_scale;
			} else {
				image_xscale = size_scale;
			}
		}
        break;
        
    case PANGO_STATE.REST:
        // Handle resting behavior, potentially transitioning back to IDLE or another state
        if(idle_timer_flag)
		{
			current_state = PANGO_STATE.PREROLL;
			idle_timer_flag = false;
			sprite_index = spr_preroll;
			image_index = 0;
			speed = 0;
			alarm[0] = 60 * preroll_time;
			direction = point_direction(x, y, obj_player.x, obj_player.y);
		}
		break;
}


var _player_distance = point_distance(x, y, obj_player.x, obj_player.y);
if (_player_distance < 300 && current_state == PANGO_STATE.IDLE) {
    current_state = PANGO_STATE.PREROLL;
	idle_timer_flag = false;
	sprite_index = spr_preroll;
	image_index = 0;
	speed = 0;
	alarm[0] = 60*preroll_time;
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	
	//look_at_player(obj_player.x);
	if(x-obj_player.x >0)
	{
		image_xscale = -size_scale;
	} else {
		image_xscale = size_scale;
	}
}


