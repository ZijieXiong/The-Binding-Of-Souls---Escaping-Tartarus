/// @description Insert description here
// You can write your code in this editor
image_xscale = 0.5;
image_yscale = 0.5;


enum FRAIL_STATE {
    IDLE,
    FIRST_WALK,
	SECOND_WALK,
    BOUNCE,
	BOUNCES,
	PREBOUNCES
}

frail_shadow = instance_create_layer(x, y, "Instances", oSkullFrailShadow);
frail_shadow.depth = depth+2;

current_state = FRAIL_STATE.IDLE;

start_x = 0;
start_y = 0;
target_x = 0;
target_y = 0;

height = 0;
max_height = 100;
max_ratio = 0.7;

logic_x = 0;
logic_y = 0;

first_walk_time = 2 * 60;
second_walk_time = 1 * 60;
bounce_time = 2 * 60;

state_end_flag = false;

alpha = 0;
count = 0;

speed = 0;

fire_pit_radius = 150;

stop_bounce = false;

fire_pit_erruption_delay_time = 60;


begin_first_walk = function(_sx, _sy, _tx, _ty)
{
		start_x = _sx;
		start_y = _sy;
		target_x = _tx;
		target_y = _ty;
		
		count = 0;
		current_state = FRAIL_STATE.FIRST_WALK;
}

begin_second_walk = function(_sx, _sy, _tx, _ty)
{
		start_x = _sx;
		start_y = _sy;
		target_x = _tx;
		target_y = _ty;
		
		count = 0;
		current_state = FRAIL_STATE.SECOND_WALK;
		audio_play_sound(snd_boss_movement, 0, false);
}

begin_bounce = function(_bounce_time=2*60)
{
	bounce_time = _bounce_time;
	logic_x = x;
	logic_y = y;
	count = 0;
	current_state = FRAIL_STATE.BOUNCE;
}

begin_bounces = function(_initial_time=1*60, _bounce_time=2*60)
{
	bounce_time = _bounce_time;
	//logic_x = x;
	//logic_y = y;
	//count = 0;
	current_state = FRAIL_STATE.PREBOUNCES;
	//stop_bounce = false;
	state_end_flag = false;
	alarm[0] = _initial_time;
}

triangle_dist = function(_ratio, _t)
{
	return _t < _ratio ? _t/_ratio : (1-_t)/(1-_ratio);
	
}

ease_in_out_cubic = function(_x) {
return _x < 0.5 ? 4 * _x * _x * _x : 1 - Math.pow(-2 * _x + 2, 3) / 2;
}


die = function() {
	with(frail_shadow) {instance_destroy();}
	instance_destroy();
}

activate_nearby_firepit = function() {
	var _list = ds_list_create();
	var _num = collision_circle_list(x, y, fire_pit_radius, oFirePit, false, true, _list, false);
	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i;)
	    {
	        with(_list[| i]) {soft_burst();}
	    }
	}
	ds_list_destroy(_list);
}

activate_all_firepit = function() {
	var _list = ds_list_create();
	var _num = collision_circle_list(x, y, 1000, oFirePit, false, true, _list, false);
	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i;)
	    {
	        with(_list[| i]) {hard_burst();}
	    }
	}
	ds_list_destroy(_list);
}

shoot = function(_is_cross) {
	
	for(var _dir = 0; _dir <= 360; _dir += 90;)
	{
		var _bullet = instance_create_layer(x, y, "Instances", oBossFire);
		_bullet.speed = 3  ;
		
		_bullet.direction= _is_cross ? _dir+45 : _dir;
		_bullet.image_angle = _bullet.direction;
	}
	
}

function play_hit_part_effect(_spr,_dir,_color1,_color2,_life1,_life2, _burst){
	var instance_effect = instance_create_depth(x,y,depth,obj_particle);
	instance_effect.set_size(0.5,1);
	instance_effect.set_sprite(_spr,false,false,true);
	instance_effect.set_depth(depth+1);
	instance_effect.set_orientation(0,360);
	if _color1 	instance_effect.set_color_mix(_color1,_color2);
	instance_effect.set_alpha(random_range(0.6,1),0);
	instance_effect.set_direction(_dir-90,_dir+90);
	instance_effect.set_speed(3,5,-0.3);
	instance_effect.set_life(_life1,_life2);
	instance_effect.set_timer(120);
	instance_effect.burst(_burst);
}