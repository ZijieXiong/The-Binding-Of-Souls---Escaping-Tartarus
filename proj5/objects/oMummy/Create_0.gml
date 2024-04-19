/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();




_health = 50;
walk_speed = 1;
chase_speed = 2;

is_alerted = false;

size_scale = 1.5;

target_x = 0;
target_y = 0;

idle_timer_flag = false;

attack_time = 0.5;
attack_prepare_time = 0.5;
attack_speed = 5;
attack_cooldown = 5;
attack_ready = true;
attack_range = 100;

alarm[0]= 60;
image_speed = 0.15;



enum MUMMY_STATE {
    IDLE,
    WALK,
	CHASE,
	PREATTACK,
	ATTACK,
    REBORN,
    DEATH
}

// Initial state
current_state = MUMMY_STATE.REBORN;
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
    current_state = MUMMY_STATE.CHASE;
	idle_timer_flag = false;
	sprite_index = spr_mummy_walk;
	image_index = 0;
	speed = chase_speed;
}

reborn = function()
{
	is_alerted = true;
	current_state = MUMMY_STATE.REBORN;
	idle_timer_flag = false;
	sprite_index = spr_mummy_reborn;
	image_index = 0;
	speed = 0;
	alarm[0] = 1 * 60;
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