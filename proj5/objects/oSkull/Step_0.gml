/// @description Insert description here
// You can write your code in this editor


//if (point_distance(obj_player.x, obj_player.y, x, y) < ENEM_DISTANCE) {
//	self.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
//	move_towards_point(obj_player.x, obj_player.y, trackerSpeed);
//}
//else {
//	speed = 0;
//}

var _player_x = obj_player_main.x;
var _player_y = obj_player_main.y;



switch (current_state) {
    case SKULL_STATE.IDLE:
        //Idle
		//show_debug_message("Skull Idle");
		if(idle_timer_flag)
		{
			current_state = SKULL_STATE.PRECHASE;
			idle_timer_flag = false;
			
			var _dist_left = point_distance(x + left_pos_x, y + left_pos_y, _player_x, _player_y);
			var _dist_right = point_distance(x + right_pos_x, y + right_pos_y, _player_x, _player_y);
			
			is_left_dom = _dist_left < _dist_right;
			
			
			
			var _distance = 0;
			var _direction = 0;
			if(is_left_dom)
			{
				//_distance = point_distance(x+left_pos_x, y+left_pos_y, _player_x, _player_y);
				//_direction = point_direction(x+left_pos_x, y+left_pos_y, _player_x, _player_y);
				with(left_frail)
				{
					begin_first_walk(x,y, _player_x, _player_y);
				}
				image_angle = 90+point_direction(x, y, obj_player.x, obj_player.y);
			} else
			{
				//_distance = point_distance(x+right_pos_x, y+right_pos_y, _player_x, _player_y);
				//_direction = point_direction(x+right_pos_x, y+right_pos_y, _player_x, _player_y);
				with(right_frail)
				{
					begin_first_walk(x,y, _player_x, _player_y);
				}
				image_angle = -90+point_direction(x, y, obj_player.x, obj_player.y);
			}
			
			//alarm[0] = first_walk_time;
			
			target_x = _player_x;
			target_y = _player_y;
			speed = 0;
		}
        break;
		
	case SKULL_STATE.PRECHASE:
		//show_debug_message("Skull PRECHASE");
		//reach one hand first
		
		if(is_left_dom && point_distance(left_frail.x, left_frail.y, target_x, target_y)<10)
		{
			
			current_state = SKULL_STATE.CHASE;
			speed = move_speed;
			direction = point_direction(x, y, target_x, target_y);
			var _dist = frail_radius * 2;
			var _dir = point_direction(target_x, target_y, x ,y);
			var _tar_x = target_x + lengthdir_x(_dist, _dir);
			var _tar_y = target_y + lengthdir_y(_dist, _dir);
			
			with(right_frail)
			{
				begin_second_walk(x, y, _tar_x, _tar_y);
			}
			
		}
		
		if(!is_left_dom && point_distance(right_frail.x, right_frail.y, target_x, target_y)<10)
		{
			current_state = SKULL_STATE.CHASE;
			speed = move_speed;
			direction = point_direction(x, y, target_x, target_y);
			var _dist = frail_radius * 2;
			var _dir = point_direction(target_x, target_y, x ,y);
			var _tar_x = target_x + lengthdir_x(_dist, _dir);
			var _tar_y = target_y + lengthdir_y(_dist, _dir);
			
			with(left_frail)
			{
				begin_second_walk(x, y, _tar_x, _tar_y);
			}
		}
		break;
		
		
	case SKULL_STATE.CHASE:
	//reach the main body and reach the other hand
		if(point_distance(x, y, target_x, target_y)<frail_radius)
		{
				speed = 0;
				current_state = SKULL_STATE.POSTCHASE;
				idle_timer_flag = false;
				alarm[0]=60;
				chase_counter++;
				if(chase_counter >= chase_times_before_turn)
				{	
					current_state = SKULL_STATE.TURN;
					idle_timer_flag = false;
					alarm[0]=-1;
					chase_counter = 0;
				}
				
		}
		break;
	case SKULL_STATE.POSTCHASE:
		if(idle_timer_flag)
		{
			current_state = SKULL_STATE.PRECHASE;
			idle_timer_flag = false;
			
			var _dist_left = point_distance(x + left_pos_x, y + left_pos_y, _player_x, _player_y);
			var _dist_right = point_distance(x + right_pos_x, y + right_pos_y, _player_x, _player_y);
			
			is_left_dom = _dist_left < _dist_right;
			
			
			
			var _distance = 0;
			var _direction = 0;
			if(is_left_dom)
			{
				//_distance = point_distance(x+left_pos_x, y+left_pos_y, _player_x, _player_y);
				//_direction = point_direction(x+left_pos_x, y+left_pos_y, _player_x, _player_y);
				with(left_frail)
				{
					begin_first_walk(x,y, _player_x, _player_y);
				}
			} else
			{
				//_distance = point_distance(x+right_pos_x, y+right_pos_y, _player_x, _player_y);
				//_direction = point_direction(x+right_pos_x, y+right_pos_y, _player_x, _player_y);
				with(right_frail)
				{
					begin_first_walk(x,y, _player_x, _player_y);
				}
			}
			
			//alarm[0] = first_walk_time;
			
			target_x = _player_x;
			target_y = _player_y;
			speed = 0;
		}
		break;
		
		case SKULL_STATE.TURN:
			var _target_dir = point_direction(x, y, obj_player_main.x, obj_player_main.y);
		
			var _angle_difference = angle_difference(_target_dir, image_angle);
			
			// Rotate towards the target_direction by turn_speed
			if (_angle_difference > 0) {
				image_angle += 5;
			} else {
				image_angle -= 5;
			}
			
			
			if (abs(_angle_difference) < 1) {
			    // Close enough to directly set the direction
				
				/*
				if(just_spinned) //after spinning, turn before cast spell 
				{
					just_spinned = false;
					speed = 0;
					current_state = SKULL_STATE.PRESPELL_A;
					idle_timer_flag = false;
					alarm[0] = 1 * 60;
					break;
				}
				*/
				
			    image_angle = _target_dir;
				current_state = SKULL_STATE.POSTCHASE;
				idle_timer_flag = false;
				alarm[0]=60;
				turn_counter++;
				if(turn_counter >= turn_times_before_spin)
				{
					turn_counter = 0;
					current_state = SKULL_STATE.SPIN;
					idle_timer_flag = false;
					alarm[0] = 5 * 60;
					speed = spin_speed;
					with(left_frail)
					{	
						begin_bounces(0.6*60, 1.2*60);
					}
					with(right_frail)
					{	
						begin_bounces(1,1.2*60);
					}
				}
				
			} 
		break;
		
		case SKULL_STATE.SPIN:
			direction = point_direction(x ,y, obj_player_main.x, obj_player_main.y);
			image_angle += spin_angular_speed;
			
			var _x, _y;
			var _coord = frail_reset(true);
			_x = _coord[0];
			_y = _coord[1];
			with(left_frail)
			{
				logic_x = _x;
				logic_y = _y;
			}
			_coord = frail_reset(false);
			_x = _coord[0];
			_y = _coord[1];
			with(right_frail)
			{
				logic_x = _x;
				logic_y = _y;
			}
			
			
			if(idle_timer_flag)
			{
				
				left_frail.stop_bounce = true;
				right_frail.stop_bounce = true;
				
				/*
				current_state = SKULL_STATE.TURN;
				idle_timer_flag = false;
				just_spinned = true;
				alarm[0]=-1;*/
				//cast_spell_A(2*60, 0.5*60);
				/*
				speed = 0;
				current_state = SKULL_STATE.IDLE;
				idle_timer_flag = false;
				alarm[0] = 1 * 60;
				*/
				speed = 0;
				current_state = SKULL_STATE.PRESPELL_A;
				idle_timer_flag = false;
				alarm[0] = 1 * 60;
			}
		break;
		
		case SKULL_STATE.PRESPELL_A:
			var _target_dir = point_direction(x, y, obj_player.x, obj_player.y);
		
			var _angle_difference = angle_difference(_target_dir, image_angle);
			
			// Rotate towards the target_direction by turn_speed
			if (_angle_difference > 0) {
				image_angle += 5;
			} else {
				image_angle -= 5;
			}
			
			
			if (abs(_angle_difference) < 1 && idle_timer_flag) {
				cast_spell_A(2*60, 0.5*60);
			}
			
		break;
			
		
		case SKULL_STATE.SPELL_A:
			
			if(idle_timer_flag)
			{
				speed = 0;
				current_state = SKULL_STATE.IDLE;
				idle_timer_flag = false;
				alarm[0] = 1 * 60;
			}
		break;
			
}


//with(left_frail)
//{
//	x = other.x + other.left_pos_x;
//	y = other.y + other.left_pos_y;
//}

//with(right_frail)
//{
//	x = other.x + other.right_pos_x;
//	y = other.y + other.right_pos_y;
//}

if(_health <= 0)
{
	die();
}

function die(){
	with(left_frail){die();}
	with(right_frail){die();}
	//instance_destroy(left_frail);
	//instance_destroy(right_frail);
	instance_destroy();
	audio_play_sound(enemyDie, 0, false);
}
