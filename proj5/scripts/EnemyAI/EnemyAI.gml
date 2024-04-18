// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @param instance_target
/// @param secs_between_hits 
function TaskSpell1(instance_target, secs_preparation) : BTreeLeaf() constructor{
	name = "Task Cast magic ball toward player";
	
	target_hit = instance_target;
	time_preparation_max = secs_preparation;
	time_preparation = 0;
	
	
	
	/// @override
	static Process = function(){
		if(!instance_exists(target_hit)) return BTStates.Failure;
		if(++time_preparation >= time_preparation_max){
			time_preparation = 0;
			var _dir = point_direction(black_board_ref.user.x, black_board_ref.user.y, target_hit.x, target_hit.y);
			var _bullet = instance_create_layer(black_board_ref.user.x, black_board_ref.user.y, "Instances", oMummyLightning);
			_bullet.speed = 4  ;
			_bullet.direction= _dir;
			_bullet.image_angle = _bullet.direction;
			//target_hit.TakeDamage();
			return BTStates.Success;
		}
		else 
			return BTStates.Running;
	}
}

/// @param obj_ref
/// @param range 
function TaskCheckSpell(obj, secs_cooldown) : BTreeLeaf() constructor {
	name = "Task check if the spell cooldown is ready";
	object_find = obj;
	
	time_cooldown = secs_cooldown;
	
	time_last_cast = 0;
	
	instance_ref = noone;

	/// @override
	static Init = function(){
		instance_ref = instance_find(object_find, 0);
	}
	
	/// @override
	static Process = function(){
		
		
		//if(instance_exists(instance_ref) && black_board_ref.user.timer_spell_2 >= time_cooldown)
		if(instance_exists(instance_ref) && (current_time - time_last_cast)*0.001 >= time_cooldown)
		{
			//black_board_ref.user.timer_spell_2 = 0;
			time_last_cast = current_time;
			return BTStates.Success;
		}
		else 
			return BTStates.Failure;
	}
}

function TaskSpell2(instance_target, secs_preparation) : BTreeLeaf() constructor{
	name = "Task Cast big magic ball toward player";
	
	target_hit = instance_target;
	time_preparation_max = secs_preparation;
	time_preparation = 0;
	
	
	
	
	/// @override
	static Process = function(){
		if(!instance_exists(target_hit)) return BTStates.Failure;
		if(++time_preparation >= time_preparation_max){
			time_preparation = 0;
			var _dir = point_direction(black_board_ref.user.x, black_board_ref.user.y, target_hit.x, target_hit.y);
			var _bullet = instance_create_layer(black_board_ref.user.x, black_board_ref.user.y, "Instances", oMummySplitBullet);
			_bullet.speed = 4  ;
			_bullet.direction= _dir;
			_bullet.image_angle = _bullet.direction;
			
			
			//target_hit.TakeDamage();
			return BTStates.Success;
		}
		else 
			return BTStates.Running;
	}
}