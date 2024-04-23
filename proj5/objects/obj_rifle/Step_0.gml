#region Inputs
shoot = mouse_check_button(mb_left);
charge = mouse_check_button(mb_right)
#endregion

x = obj_player.x;
y = obj_player.y;
direction = point_direction(x,y,mouse_x,mouse_y);

if (direction > 90) && (direction < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;
depth = obj_player.depth-1;





if (shoot){
	rifle_timer += 1
	if(!_reload && increase_damage < max_damage_increase){
	increase_damage += damage_increase_pre_frame * global.riffleChargingSpeed
	//increase_cooldown += cooldown_increase_pre_frame * global.riffleChargingSpeed
	bullet_speed = max_bullet_speed
	pressed = true
	}
	
}

if(increase_damage > max_damage_increase){
	increase_damage = max_damage_increase
}

if(mouse_check_button_released(mb_left)){
	if(!_reload || rifle_cooldown == 0){
		var bullet = instance_create_layer(x+lengthdir_x(24,direction),y+lengthdir_y(24,direction), "Instances", obj_rifle_bullet);
	    bullet.speed = bullet_speed;
	    bullet.direction= point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	    bullet.image_angle = bullet.direction;
		bullet.damage += increase_damage;
		
		if(increase_damage == max_damage_increase){
			sprite_index = spr_rifle_shoot_max
			bullet.sprite_index = spr_rifle_bullet_max
			bullet._rifflePenetrate = global.rifflePenetrate
			bullet._explosive = global.riffle_bullet_explosive
		}else{
			sprite_index = spr_rifle_shoot_normal
		}
		rifle_cooldown = cooldown
		
		var _reload_total_frames = sprite_get_number(spr_rifle_reload)
		var _reload_fps = _reload_total_frames / (cooldown*global.shootingIntervalMultiplier)
		sprite_set_speed(spr_rifle_reload, _reload_fps, spritespeed_framespersecond)
		
		_reload = true
		increase_damage = 0
		increase_cooldown = 0
		pressed = false
		bullet_speed = global.bulletSpeed 
		rifle_timer = 0
		
		audio_play_sound(rifleChargedShoot, 0, false);
		
	}
	
}
/*
if (shoot && !charge) {
	if(rifle_cooldown == 0 && !_reload){
		audio_play_sound(rifleContinuousShoot2, 0, false);
		sprite_index = spr_rifle_shoot_normal
		var bullet = instance_create_layer(x+lengthdir_x(24,direction),y+lengthdir_y(24,direction), "Instances", obj_rifle_bullet);
		bullet.speed = global.bulletSpeed;
		bullet.direction= point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
		bullet.damage = left_buttom_damage
		bullet.image_angle = bullet.direction;
		rifle_cooldown = room_speed * interval;
	}
}
*/

//if(shotgun_cooldown != 0){
if(sprite_index == spr_rifle_shoot_max || sprite_index == spr_rifle_shoot_normal) 
         && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	sprite_index = spr_rifle_reload;
}

if(sprite_index == spr_rifle_shoot_normal || sprite_index == spr_rifle_reload) && (image_index >= (sprite_get_number(sprite_index) - 1) ){
	sprite_index = spr_rifle
	_reload = false;
}
/*
if(rifle_cooldown > 0){
	rifle_cooldown = max(0,rifle_cooldown-1);
}
