/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



switch (current_state) {
    case EPANGO_STATE.IDLE:
        //Idle
		//show_debug_message("Pango Idle");
		if(idle_timer_flag)
		{
			current_state = EPANGO_STATE.WALK;
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
        
    case EPANGO_STATE.WALK:
        // Handle walk behavior, including transitions to IDLE or PREROLL
		//show_debug_message("Pango Walk");
		if(point_distance(x, y, target_x, target_y)<15)
		{
			if(random(10) >= 5)
			{
				current_state = EPANGO_STATE.TRACK;
				sprite_index = Spr_Track;
				image_index = 0;
				speed = 0;
				alarm[0] = 60 * 2;
			} else
			{
				current_state = EPANGO_STATE.IDLE;
				sprite_index = Spr_Idle;
				image_index = 0;
				speed = 0;
				alarm[0] = 60*random_range(2, 5);
			}
			
		}
        break;
	
	case EPANGO_STATE.TRACK:
		//show_debug_message("Pango Track");
		if(idle_timer_flag)
		{
			current_state = EPANGO_STATE.IDLE;
			idle_timer_flag = false;
			sprite_index = Spr_Idle;
			image_index = 0;
			speed = 0;
			alarm[0] = 60*random_range(2, 5);
			
		}
        break;
        
    case EPANGO_STATE.PREROLL:
        // Initiate preroll setup and animation\
		if(idle_timer_flag)
		{
			current_state = EPANGO_STATE.ROLL;
			idle_timer_flag = false;
			sprite_index = spr_rolling;
			speed = roll_speed;
			direction = point_direction(x, y, obj_player_main.x, obj_player_main.y);
			is_hit = false;
			audio_play_sound(pangoRoll, 0, true);
			alarm[1] = 1;
			is_trail = true;
		}
        
        break;
        
    case EPANGO_STATE.ROLL:
        // Execute rolling behavior towards the player
		
		
		
		if(idle_timer_flag)
		{
			current_state = EPANGO_STATE.STOPROLL;
			idle_timer_flag = false;
			sprite_index = Spr_Stop_Roll;
			image_index = 0;
			speed = 0;
			alarm[0] = 60 * stoproll_time;
			audio_stop_sound(pangoRoll);
			is_trail = false;
		}
        break;
        
    case EPANGO_STATE.STOPROLL:
        // Handle stoproll animation or effects
		if(idle_timer_flag)
		{
			current_state = EPANGO_STATE.REST;
			idle_timer_flag = false;
			sprite_index = Spr_Idle;
			image_index = 0;
			speed = 0;
			alarm[0] = 10;
			//look_at_player(obj_player.x);
			if(x-obj_player_main.x >0)
			{
				image_xscale = -size_scale;
			} else {
				image_xscale = size_scale;
			}
		}
        break;
        
    case EPANGO_STATE.REST:
        // Handle resting behavior, potentially transitioning back to IDLE or another state
        if(idle_timer_flag)
		{
			current_state = EPANGO_STATE.PREROLL;
			idle_timer_flag = false;
			sprite_index = spr_preroll;
			image_index = 0;
			speed = 0;
			alarm[0] = 60 * preroll_time;
			direction = point_direction(x, y, obj_player_main.x, obj_player_main.y);
		}
		break;
}


var _player_distance = point_distance(x, y, obj_player_main.x, obj_player_main.y);
if (_player_distance < 200 && current_state == EPANGO_STATE.IDLE) {
	is_enraged = true;
}

if(_initial_health != _health) is_enraged = true;

//Only triggerred once
if(is_enraged && !is_alerted)
{
	current_state = EPANGO_STATE.PREROLL;
	idle_timer_flag = false;
	sprite_index = spr_preroll;
	image_index = 0;
	speed = 0;
	alarm[0] = 60*preroll_time;
	direction = point_direction(x, y, obj_player_main.x, obj_player_main.y);
	
	//look_at_player(obj_player.x);
	if(x-obj_player_main.x >0)
	{
		image_xscale = -size_scale;
	} else {
		image_xscale = size_scale;
	}
	is_alerted = true;	
}



