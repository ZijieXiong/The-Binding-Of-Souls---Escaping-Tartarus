// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TaskLoadLaser(instance_target, secs_preparation) : BTreeLeaf() constructor{
	name = "Task Cast big magic ball toward player";
	
	target_hit = instance_target;
	time_preparation_max = secs_preparation;
	time_preparation = 0;
	
	is_loading = false;
	
	/// @override
	static Process = function(){
		if(!instance_exists(target_hit)) return BTStates.Failure;
		
		if(!is_loading)
		{
			black_board_ref.user.shoot_target_x =  target_hit.x;
			black_board_ref.user.shoot_target_y =  target_hit.y;
			is_loading = true;
		}
		
		if(++time_preparation >= time_preparation_max){
			time_preparation = 0;
			is_loading = false;
			return BTStates.Success;
		}
		
		return BTStates.Running;
	}
}

function TaskShootLaser(instance_target, _laser_preparetion, _laser_duration, _laser_speed, _laser_width) : BTreeLeaf() constructor{
	name = "Task Cast big magic ball toward player";
	
	target_hit = instance_target;
	time_preparation_max = _laser_preparetion;
	time_preparation = 0;
	
	laser_source = pointer_null;
	laser_body = pointer_null;
	laser_flame = pointer_null;
	
	laser_width = _laser_width;
	
	
	target_x = 0;
	target_y = 0;

	
	laser_speed = _laser_speed;
	
	is_loading = false;
	is_shooting = false;
	
	time_laser_duration = _laser_duration;
	time_laser = 0;
	
	
	/// @override
	static Process = function(){
		
		if(!instance_exists(target_hit)) return BTStates.Failure;
		
		if(!is_loading)
		{
			target_x = target_hit.x;
			target_y = target_hit.y;
			is_loading = true;
		}
		
		if(is_loading && !is_shooting && ++time_preparation >= time_preparation_max )
		{
			is_shooting = true;
			var _curr_depth = black_board_ref.user.depth;
			laser_source = instance_create_layer(black_board_ref.user.x, black_board_ref.user.y, "Instances", oRobotLaserSouce);
			laser_body = instance_create_layer(black_board_ref.user.x, black_board_ref.user.y, "Instances", oRobotLaserBody);
			laser_flame = instance_create_layer(black_board_ref.user.x, black_board_ref.user.y, "Instances", oRobotLaserFlame);
			laser_source.life_time =time_laser_duration; 
			laser_source.depth = _curr_depth-1;
			laser_body.life_time =time_laser_duration; 
			laser_body.depth = _curr_depth-1;
			laser_flame.life_time =time_laser_duration; 
			laser_flame.depth = _curr_depth-2;
			get_radius_blur(time_laser_duration, laser_flame, 0.1,  400, 0.01);
			screenshake(time_laser_duration, 1.5, 0.2);
			
		}
		
		if(is_shooting &&  ++time_laser >= time_laser_duration){
			time_preparation = 0;
			time_laser = 0;
			with(laser_source){instance_destroy();}
			with(laser_body){instance_destroy();}
			with(laser_flame){instance_destroy();}
			//instance_destroy(laser_source);
			//instance_destroy(laser_body);
			laser_source = pointer_null;
			laser_body = pointer_null;
			laser_flame = pointer_null;
			is_shooting = false;
			is_loading = false;

			return BTStates.Success;
		}
		
		if(is_shooting)
		{
			var _laser_dir = point_direction(black_board_ref.user.x, black_board_ref.user.y, target_x, target_y);
			laser_source.image_angle = _laser_dir;
			laser_source.image_yscale = laser_width;
			laser_source.image_xscale = laser_width;
			laser_body.image_angle = _laser_dir;
		
			var _laser_length = point_distance(black_board_ref.user.x, black_board_ref.user.y, target_x, target_y);
			laser_body.image_xscale = _laser_length / 64;
			laser_body.image_yscale = laser_width;
			
			laser_flame.x = target_x;
			laser_flame.y = target_y;
		
			var _laser_move_dir = point_direction(target_x, target_y, target_hit.x, target_hit.y);
			target_x +=  lengthdir_x(laser_speed, _laser_move_dir);
			target_y += lengthdir_y(laser_speed, _laser_move_dir);
			
		}
		
		return BTStates.Running;
	}
}


function TaskLaunchMissile(_num, secs_preparation) : BTreeLeaf() constructor{
	name = "Task Cast big magic ball toward player";
	
	num_missile = _num;
	time_preparation_max = secs_preparation;
	time_preparation = 0;
	
	
	
	
	/// @override
	static Process = function(){
		//if(!instance_exists(target_hit)) return BTStates.Failure;
		if(++time_preparation >= time_preparation_max){
			time_preparation = 0;
			
			repeat(8) black_board_ref.user.launch_missile();
			
			return BTStates.Success;
		}
		else 
			return BTStates.Running;
	}
}

function TaskTeleport(secs_preparation) : BTreeLeaf() constructor{
	name = "Task teleport";
	
	time_preparation_max = secs_preparation;
	time_preparation = 0;
	
	is_begin = false;
	tele_target_x = 0;
	tele_target_y = 0;
	
	/// @override
	static Process = function(){
		//if(!instance_exists(target_hit)) return BTStates.Failure;
		
		if(!is_begin)
		{
			is_begin = true;
			var tele_target = black_board_ref.user.get_new_location();
			tele_target_x = tele_target[0];
			tele_target_y = tele_target[1];
			black_board_ref.user.create_tele_effect(tele_target_x, tele_target_y);
			black_board_ref.user.teleport_to_(0, 0);
		}
		
		if(++time_preparation >= time_preparation_max){
			time_preparation = 0;
			
			black_board_ref.user.teleport_to_(tele_target_x, tele_target_y);
			is_begin = false;
			tele_target_x = 0;
			tele_target_y = 0;
			
			return BTStates.Success;
		}
		else 
			return BTStates.Running;
	}
}

