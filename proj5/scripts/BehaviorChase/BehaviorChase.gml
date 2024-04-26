// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @param obj_ref
/// @param range 
function TaskInstanceInRange(obj, range) : BTreeLeaf() constructor {
	name = "Task Instance In Range";
	object_find = obj;
	range_limit = range;
	
	instance_ref = noone;

	/// @override
	static Init = function(){
		instance_ref = instance_find(object_find, 0);	
	}
	
	/// @override
	static Process = function(){
		
		
		if(instance_exists(instance_ref) && point_distance(black_board_ref.user.x, black_board_ref.user.y, instance_ref.x, instance_ref.y) <= range_limit)
			return BTStates.Success;
		else 
			return BTStates.Failure;
	}
}

/// @param speed
/// @param timer_secs
function TaskPatrolSimple(speed, timer_secs) : BTreeLeaf() constructor {
	name = "Taks Patrol Simple";
	patrol_speed = speed;
	
	patrol_spd_x = 0;
	patrol_spd_y = 0;
	
	patrol_direction = 0;
	patrol_timer_max = timer_secs * room_speed;
	patrol_timer = 0;
	
	/// @override
	static Process = function(){
		if(--patrol_timer <= 0){
			patrol_direction = irandom(360);
			patrol_spd_x = lengthdir_x(patrol_speed, patrol_direction);
			patrol_spd_y = lengthdir_y(patrol_speed, patrol_direction);
			patrol_timer = patrol_timer_max;
		}
		
		black_board_ref.user.x += patrol_spd_x;
		black_board_ref.user.y += patrol_spd_y;
		return BTStates.Success;
	}
	
}

/// @param speed
/// @param timer_secs
function TaskPatrol(speed, timer_secs) : BTreeLeaf() constructor {
	name = "Taks Patrol Simple";
	patrol_speed = speed;
	
	patrol_spd_x = 0;
	patrol_spd_y = 0;
	
	patrol_direction = 0;
	patrol_timer_max = timer_secs * room_speed;
	patrol_timer = 0;
	
	/// @override
	static Process = function(){
		if(--patrol_timer <= 0){
			patrol_direction = irandom(360);
			patrol_spd_x = lengthdir_x(patrol_speed, patrol_direction);
			patrol_spd_y = lengthdir_y(patrol_speed, patrol_direction);
			patrol_timer = patrol_timer_max;
		}
		
		black_board_ref.user.x += patrol_spd_x;
		black_board_ref.user.y += patrol_spd_y;
		return BTStates.Success;
	}
	
	static get_new_location = function(_min_dist, _max_dist)
	{
		do {
		var _distance = random_range(_min_dist, _max_dist);
		var _direction = random(360);
		target_x = x + lengthdir_x(_distance, _direction);
		target_y = y + lengthdir_y(_distance, _direction);
		} until (!place_meeting(target_x, target_y, obj_wall)) ;
		show_debug_message("x:"+string(target_x) + ", y:" + string(target_y));
	
		//return [target_x, target_y];
	}
	
}

/// @param instance_chase
/// @param speed_chase 
/// @param distance_max
/// @param distance_min
function TaskChaseInstance(instance_chase, speed_chase, distance_max, distance_min) : BTreeLeaf() constructor{
	name = "Task Chase Instance";
	
	chase_speed = speed_chase;
	instance_to_chase = instance_chase;
	distance_maximun_to_stop_chase = distance_max;
	distance_minimun_to_stop_chase = distance_min;
	
	///@override
	static Process = function(){
		if(instance_exists(instance_to_chase)){
			
			// Check Stop chasing
			var _dist = point_distance(black_board_ref.user.x, black_board_ref.user.y, instance_to_chase.x, instance_to_chase.y);
			if(_dist <= distance_minimun_to_stop_chase){
				with(black_board_ref.user) {path_end();}
				return BTStates.Success;
			}
			else if (_dist >= distance_maximun_to_stop_chase){
				with(black_board_ref.user) {path_end();}
				return BTStates.Failure;
			}
			else {
				// Moving towards chasing
				//var _dir = point_direction(black_board_ref.user.x, black_board_ref.user.y, instance_to_chase.x, instance_to_chase.y);
				//black_board_ref.user.x += lengthdir_x(chase_speed, _dir);
				//black_board_ref.user.y += lengthdir_y(chase_speed, _dir);	
				var _found_player = mp_grid_path(global.mp_grid,black_board_ref.user.path,black_board_ref.user.x,black_board_ref.user.y, instance_to_chase.x, instance_to_chase.y,choose(0,1))
				with(black_board_ref.user)
				{
					
					//if _found_player{
						path_start(other.black_board_ref.user.path,other.chase_speed,path_action_stop,false);
					//}
				}
				
		
				return BTStates.Running;
			}
		}
		else 
			return BTStates.Failure

	}
	
}

/// @param instance_chase
/// @param speed_chase 
/// @param distance_max
/// @param distance_min
function TaskChaseInstanceNoPathfind(instance_chase, speed_chase, distance_max, distance_min) : BTreeLeaf() constructor{
	name = "Task Chase Instance";
	
	chase_speed = speed_chase;
	instance_to_chase = instance_chase;
	distance_maximun_to_stop_chase = distance_max;
	distance_minimun_to_stop_chase = distance_min;
	
	///@override
	static Process = function(){
		if(instance_exists(instance_to_chase)){
			
			// Check Stop chasing
			var _dist = point_distance(black_board_ref.user.x, black_board_ref.user.y, instance_to_chase.x, instance_to_chase.y);
			if(_dist <= distance_minimun_to_stop_chase)
				return BTStates.Success;
			else if (_dist >= distance_maximun_to_stop_chase)
				return BTStates.Failure;
			else {
				 //Moving towards chasing
				var _dir = point_direction(black_board_ref.user.x, black_board_ref.user.y, instance_to_chase.x, instance_to_chase.y);
				black_board_ref.user.x += lengthdir_x(chase_speed, _dir);
				black_board_ref.user.y += lengthdir_y(chase_speed, _dir);	
				
				
		
				return BTStates.Running;
			}
		}
		else 
			return BTStates.Failure

	}
	
}

/// @param instance_target
/// @param secs_between_hits 
function TaskMeleeHitTarget(instance_target, secs_preparation) : BTreeLeaf() constructor{
	name = "Task Melee Hit on Target";
	
	target_hit = instance_target;
	time_preparation_max = secs_preparation * room_speed;
	time_preparation = 0;
	
	/// @override
	static Process = function(){
		if(!instance_exists(target_hit)) return BTStates.Failure;
		if(++time_preparation >= time_preparation_max){
			time_preparation = 0;
			target_hit.life -= 10;
			return BTStates.Success;
		}
		else 
			return BTStates.Running;
	}
}