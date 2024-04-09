/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();





_initial_health = _health;
//_health =_initial_health;

walk_speed = 1;
roll_speed = 8;

is_alerted = false;
is_enraged = false;

size_scale = 3;

target_x = 0;
target_y = 0;

hit_wall_x = 0;
hit_wall_y = 0;

hit_player_x = 0;
hit_player_y = 0;

is_hit = false; 

idle_timer_flag = false;

preroll_time = 1.2;
roll_time = 8;
stoproll_time = 1.1;

alarm[0]= 60;



enum EPANGO_STATE {
    IDLE,
    WALK,
	TRACK,
    PREROLL,
    ROLL,
    STOPROLL,
    REST
}

// Initial state
current_state = EPANGO_STATE.IDLE;

get_new_location = function(_min_dist, _max_dist)
{
	do {
	var _distance = random_range(_min_dist, _max_dist);
	var _direction = random(360);
	target_x = x + lengthdir_x(_distance, _direction);
	target_y = y + lengthdir_y(_distance, _direction);
	} until (!place_meeting(target_x, target_y, obj_wall)) ;
	
	
	//return [target_x, target_y];
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

summon_spike = function(_hit_x, _hit_y, _ply_x, _ply_y)
{
	//show_debug_message("x:"+string(_hit_x) + ", y:" + string(_hit_y));
	var _spike_interval = 50;
	
	var _dir = point_direction(_hit_x, _hit_y, _ply_x, _ply_y);
	var _curr_x = _hit_x + lengthdir_x(_spike_interval, _dir);
	var _curr_y = _hit_y + lengthdir_y(_spike_interval, _dir);
	
	var _height = 1000;
	var _index = 0;
	var _delay = 3;
	
	do
	{
		_index++;
		
		
		var _delta_dist = random_range(5, 10);
		var _delta_dir = random(360);
		var _tar_x = _curr_x + lengthdir_x(_delta_dist, _delta_dir);
		var _tar_y = _curr_y + lengthdir_y(_delta_dist, _delta_dir);
		
		var _spike = instance_create_layer(_tar_x, _tar_y-_height, "Instances", oPangoSpike);
		
		with (_spike)
		{
			alarm[0] = 30 + _index * _delay;
			target_x = _tar_x;
			target_y = _tar_y;
			direction = point_direction(_tar_x,  _tar_y-_height, _tar_x,_tar_y );
		}
		_curr_x = _curr_x + lengthdir_x(_spike_interval, _dir);
		_curr_y = _curr_y + lengthdir_y(_spike_interval, _dir);
	} until (place_meeting(_curr_x, _curr_y, obj_wall));
	
}