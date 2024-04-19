/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (current_state) {
    case ANUBIS_STATE.IDLE:
        //Idle
		show_debug_message("Anubis Idle");
		
		if(!is_alerted)
		{
			if(idle_timer_flag)
			{
				current_state = ANUBIS_STATE.WALK;
				idle_timer_flag = false;
				sprite_index = spr_anubis_walk;
				image_index = 0;
				get_new_location(50, 100);
				speed = walk_speed;
				direction = point_direction(x, y, target_x, target_y);
			}
		} else {
			var _collision_res = collision_rectangle(x -fight_radius, y -fight_radius, x + fight_radius, y + fight_radius, obj_player, true, 1);
			
			if(fireball_spell_ready)
			{
				idle_timer_flag = false;
				current_state = ANUBIS_STATE.RANGED_ATTACK;
				sprite_index = spr_anubis_cast;
				image_index = 0;
				alarm[0] = 0.5*60;
				fireball_spell_ready = false;
				alarm[2] = fireball_spell_cooldown * 60;
				image_speed = 0.3;
			}
			
			if(!_collision_res)
			{	
				current_state = ANUBIS_STATE.CHASE;
				sprite_index = spr_anubis_walk;
				image_index = 0;
				speed = chase_speed;
			}
			if(summon_spell_ready)
			{
				idle_timer_flag = false;
				current_state = ANUBIS_STATE.CAST;
				sprite_index = spr_anubis_cast;
				image_index = 0;
				alarm[0] = 1*60;
				summon_spell_ready = false;
				alarm[1] = summon_spell_cooldown * 60;
				image_speed = 0.15;
			}
		}
        break;
        
    case ANUBIS_STATE.WALK:
        // Handle walk behavior, including transitions to IDLE or PREROLL
		show_debug_message("Anubis Walk");
		if(point_distance(x, y, target_x, target_y)<15)
		{
			
			current_state = ANUBIS_STATE.IDLE;
			idle_timer_flag = false;
			sprite_index = spr_anubis_idle;
			image_index = 0;
			speed = 0;
			alarm[0] = 60*random_range(2, 5);
		}
        break;
		
	case ANUBIS_STATE.CHASE:
		show_debug_message("Anubis chase");
		direction = point_direction(x, y, obj_player.x, obj_player.y);
		
		var _collision_res = collision_rectangle(x -fight_radius, y -fight_radius, x + fight_radius, y + fight_radius, obj_player, true, 1);
		
		if(_collision_res)
		{	
			current_state = ANUBIS_STATE.IDLE;
			sprite_index = spr_anubis_idle;
			image_index = 0;
			speed = 0;
		}
		
		//var _found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player.x,obj_player.y,choose(0,1))
		//if _found_player{
		//	path_start(path,chase_speed,path_action_stop,false)
		//}
		break;
		
		
	case ANUBIS_STATE.CAST:
		show_debug_message("Anubis cast");
		if(idle_timer_flag)
			{
				current_state = ANUBIS_STATE.IDLE;
				idle_timer_flag = false;
				sprite_index = spr_anubis_idle;
				image_index = 0;
				speed = 0;
				//summon_mummy(x, y);
				summon_mummies(choose(1,1,1,2,2,3));
				image_speed = 0.3;
			}
		break;
		
	case ANUBIS_STATE.RANGED_ATTACK:
		show_debug_message("Anubis cast");
		if(idle_timer_flag)
			{
				current_state = ANUBIS_STATE.IDLE;
				idle_timer_flag = false;
				sprite_index = spr_anubis_idle;
				image_index = 0;
				speed = 0;
				image_speed = 0.3;
				
				fireball_attack();
			}
		break;
        
    
}


var _player_distance = point_distance(x, y, obj_player.x, obj_player.y);
if (_player_distance < alert_radius && !is_alerted) {
	start_chase_player();
	//alarm[0] = 60*preroll_time;
	
}


