/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();

if(current_state != MUMMY_STATE.DEATH && _health <= 0){
	sprite_index = spr_mummy_death;
	image_index = 0;
	current_state = MUMMY_STATE.DEATH;
	speed = 0;
	image_speed = 0.1;
	path_end();
}


switch (current_state) {
    case MUMMY_STATE.IDLE:
        //Idle
		//show_debug_message("Mummy Idle");
		if(idle_timer_flag)
		{
			current_state = MUMMY_STATE.WALK;
			idle_timer_flag = false;
			sprite_index = spr_mummy_walk;
			image_index = 0;
			get_new_location(50, 100);
			speed = walk_speed;
			direction = point_direction(x, y, target_x, target_y);
		}
        break;
        
    case MUMMY_STATE.WALK:
        // Handle walk behavior, including transitions to IDLE or PREROLL
		//show_debug_message("Mummy Walk");
		if(point_distance(x, y, target_x, target_y)<15)
		{
			
			current_state = MUMMY_STATE.IDLE;
			sprite_index = spr_mummy_idle;
			image_index = 0;
			speed = 0;
			alarm[0] = 60*random_range(2, 5);

			
		}
        break;
		
	case MUMMY_STATE.CHASE:
		//show_debug_message("Mummy chase");
		direction = point_direction(x, y, obj_player_main.x, obj_player_main.y);
		var _found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player_main.x,obj_player_main.y,choose(0,1))
		if _found_player{
			path_start(path,chase_speed,path_action_stop,false);
		}
		var _player_distance = point_distance(x, y, obj_player_main.x, obj_player_main.y);
		if(attack_ready && _player_distance<attack_range )
		{
			current_state = MUMMY_STATE.PREATTACK;
			idle_timer_flag = false;
			sprite_index = spr_mummy_attack;
			image_index = 0;
			image_speed = 0;
			speed = 0;
			alarm[0] = 60*attack_prepare_time;
			alarm[2] = 60 * attack_cooldown;
			attack_ready = false;
		}
		
		break;
		
	case MUMMY_STATE.REBORN:
		//show_debug_message("Mummy reborn");
		if(idle_timer_flag)
		{
			start_chase_player();
		}
	break;
		
	
		
        
    case MUMMY_STATE.PREATTACK:
        // Initiate preroll setup and animation\
		if(idle_timer_flag)
		{
			current_state = MUMMY_STATE.ATTACK;
			idle_timer_flag = false;
			sprite_index = spr_mummy_attack;
			speed = attack_speed;
			image_index = 0;
			image_speed = 0.3;

			alarm[0] = 60 * attack_time;
			direction = point_direction(x, y, obj_player_main.x, obj_player_main.y);
			
		}
        
        break;
        
    case MUMMY_STATE.ATTACK:
        // Execute rolling behavior towards the player
		
		if(idle_timer_flag)
		{
			current_state = MUMMY_STATE.CHASE;
			idle_timer_flag = false;
			sprite_index = spr_mummy_walk;
			image_index = 0;
			speed = chase_speed;
			//alarm[0] = 60 * 1;
			
		}
        break;
        
    case MUMMY_STATE.DEATH:
		if(image_index >= (sprite_get_number(sprite_index) - 1)){
			audio_play_sound(enemyDie, 0, false);
			instance_destroy();
		}
		break;
}


var _player_distance = point_distance(x, y, obj_player_main.x, obj_player_main.y);
if (_player_distance < 100 && !is_alerted) {
	start_chase_player();
	//alarm[0] = 60*preroll_time;
	
}


