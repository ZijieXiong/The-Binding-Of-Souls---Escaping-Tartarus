// Inherit the parent event
event_inherited();

//_health = 50 + global.currLevel*10;

is_jump = false;
target_x = 0;
target_y = 0;
jump_speed = 3;

normal_max_jump_dist =100;
attack_max_jump_dist = 50;
max_jump_dist = normal_max_jump_dist;

jump_count = 0;

alert_radius = 300;
alarm[0]=120;

size_scale = 2;
image_xscale = size_scale;
image_yscale = size_scale;

toggle_shoot = true;

get_new_location = function(_min_dist, _max_dist)
{
	var _target_x ;
	var _target_y ;
	
	do {
	var _distance = random_range(_min_dist, _max_dist);
	var _direction = random(360);
	_target_x = x + lengthdir_x(_distance, _direction);
	_target_y = y + lengthdir_y(_distance, _direction);
	} until (!place_meeting(_target_x, _target_y, obj_wall)) ;
	
	
	return [_target_x, _target_y];
}


shoot = function(_is_cross) {
	
	for(var _dir = 0; _dir <= 360; _dir += 90;)
	{
		var _bullet = instance_create_layer(x, y, "Instances", oSlimeBullet);
		_bullet.speed = 3  ;
		
		_bullet.direction= _is_cross ? _dir+45 : _dir;
		_bullet.image_angle = _bullet.direction;
	}
	
}

shoot_8_dir = function() {
	
	for(var _dir = 0; _dir < 360; _dir += 45;)
	{
		var _bullet = instance_create_layer(x, y, "Instances", oSlimeBullet);
		_bullet.speed = 3  ;
		
		_bullet.direction= _dir;
		_bullet.image_angle = _bullet.direction;
	}
	
}
