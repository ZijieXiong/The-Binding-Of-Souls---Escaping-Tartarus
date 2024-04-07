/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();




_health = 50;
walk_speed = 1;
roll_speed = 3;

is_alerted = false;

size_scale = 1;

target_x = 0;
target_y = 0;

idle_timer_flag = false;

preroll_time = 1.2;
roll_time = 8;
stoproll_time = 1.1;

alarm[0]= 60;



enum PANGO_STATE {
    IDLE,
    WALK,
	TRACK,
    PREROLL,
    ROLL,
    STOPROLL,
    REST
}

// Initial state
current_state = PANGO_STATE.IDLE;

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

look_at_player = function(_player_x)
{
	if(x-_player_x >0)
	{
		image_xscale = -size_scale;
	} else {
		image_xscale = size_scale;
	}
}