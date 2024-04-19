/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();




_health = 50;
walk_speed = 1;
chase_speed = 1;

is_alerted = false;

size_scale = 1.5;

target_x = 0;
target_y = 0;

idle_timer_flag = false;

fight_radius = 60;
alert_radius = 100;
radius_delta = 50;

summon_spell_ready = true;
summon_spell_cooldown = 3;


image_speed = 0.3;



enum ANUBIS_STATE {
    IDLE,
    WALK,
	IDLE_FIGHT,
	CHASE,
	CAST
	
}

// Initial state
current_state = ANUBIS_STATE.IDLE;
//reborn();

get_new_location = function(_min_dist, _max_dist)
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

start_chase_player = function()
{
	is_alerted = true;
    current_state = ANUBIS_STATE.CHASE;
	idle_timer_flag = false;
	sprite_index = spr_anubis_walk;
	image_index = 0;
	speed = chase_speed;
}

summon_mummy = function(_x, _y)
{
	var _inst = instance_create_layer(_x, _y, "Instances", oMummy);
	with(_inst)
	{
		reborn();
	}
	return 0;
}

summon_mummies = function(_num)
{
	for(var _i=0;_i<_num;_i++;)
	{
		var _spawn_loc = get_new_spawn_location(10, 30);
		
		
		summon_mummy(_spawn_loc[0], _spawn_loc[1]);
	}
}

get_new_spawn_location = function(_min_dist, _max_dist)
{
	var _x = 0;
	var _y = 0;
	do {
	var _distance = random_range(_min_dist, _max_dist);
	var _direction = point_direction(x, y, obj_player.x, obj_player.y) + random(180);
	_x = x + lengthdir_x(_distance, _direction);
	_y = y + lengthdir_y(_distance, _direction);
	} until (!place_meeting(_x, _y, obj_wall)) ;
	//show_debug_message("x:"+string(target_x) + ", y:" + string(target_y));
	
	return [_x, _y];
}


look_at_player = function(_player_x)
{
	if(x-_player_x >0)
	{
		image_xscale = -size_scale;
	} else {
		image_xscale = size_scale;
	}
}