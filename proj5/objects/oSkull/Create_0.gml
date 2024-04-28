/// @description Insert description here
// You can write your code in this editor
event_inherited();

image_speed = 0;
image_xscale = 1;
image_yscale = 1;
image_angle = -90;

frail_radius = 50;
left_pos_x = -frail_radius;
left_pos_y = 0;
right_pos_x = frail_radius;
right_pos_y = 0;

left_frail = instance_create_layer(x - frail_radius, y, "Instances", oSkullFrail);
right_frail = instance_create_layer(x + frail_radius, y, "Instances", oSkullFrail);

trackerSpeed = 1.5;
trackerLives = 2;
dm = instance_find(oDungeon, 0);
_health = 200 ;
health_bar.max_health = _health;

enum SKULL_STATE {
    IDLE,
    PRECHASE,
	CHASE,
    POSTCHASE,
    SPIN,
    TURN,
	SPELL_A,
	PRESPELL_A
}

current_state = SKULL_STATE.IDLE;

idle_timer_flag = false;
alarm[0] = 120;

max_step_length = 100;

is_left_dom = true;

target_x = 0;
target_y = 0;

chase_target_x = 0;
chase_target_y = 0;

move_speed = 10;

first_walk_time = 0.5 * 60;
second_walk_time = 0.3 * 60;

chase_times_before_turn = 3; //After 3 times of chase, skull turn to player
chase_counter = 0;

spin_speed = 2;
spin_angular_speed = 8;

turn_times_before_spin = 2;
turn_counter = 0;

just_spinned = false;

with(left_frail)
{
	first_walk_time = other.first_walk_time;
	second_walk_time = other.second_walk_time;
}

with(right_frail)
{
	first_walk_time = other.first_walk_time;
	second_walk_time = other.second_walk_time;
}

frail_reset = function(_is_left){
	var _target_angle = image_angle;
	if(_is_left)
	{	
		_target_angle += 90;
	} else _target_angle -= 90;
	
	//var _x = x + frail_radius * cos(_target_angle);
	//var _y = y + frail_radius * sin(_target_angle);
	
	var _x = x + lengthdir_x(frail_radius,_target_angle);
	var _y = y + lengthdir_y(frail_radius, _target_angle);
	return [_x, _y];
}

cast_spell_A = function(_total_time, _bounce_duration) {
	speed = 0;
	current_state = SKULL_STATE.SPELL_A;
	idle_timer_flag = false;
	alarm[0] = _total_time;
	with(right_frail){begin_bounce(_bounce_duration);}
	with(left_frail){begin_bounce(_bounce_duration);}
}