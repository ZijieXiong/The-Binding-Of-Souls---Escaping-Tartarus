#region Inputs
shoot = mouse_check_button(mb_left);
#endregion

x = obj_player.x;
y = obj_player.y;
direction = point_direction(x,y,mouse_x,mouse_y);

if (direction > 90) && (direction < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;
depth = obj_player.depth-1;





if (shoot){
	rifle_timer += 1
	if(!_reload && increase_damage < max_damage_increase && rifle_timer > room_speed*0.3){
	increase_damage += damage_increase_pre_frame * global.riffleChargingSpeed;
	increase_cooldown += cooldown_increase_pre_frame * global.riffleChargingSpeed;
	bullet_speed = 18
	show_debug_message(increase_damage)
	pressed = true
	}
	
}

if(increase_damage > max_damage_increase){
	increase_damage = max_damage_increase
}

if(mouse_check_button_released(mb_left)){
	if(!_reload){
		show_debug_message("fires")
		var bullet = instance_create_layer(x+lengthdir_x(24,direction),y+lengthdir_y(24,direction), "Instances", obj_rifle_bullet);
	    bullet.speed = bullet_speed;
	    bullet.direction= point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	    bullet.image_angle = bullet.direction;
		bullet.damage += increase_damage;
		if(rifle_timer >= room_speed){
			sprite_index = spr_rifle_shoot_max
			bullet.sprite_index = spr_rifle_bullet_max
		}else{
			sprite_index = spr_rifle_shoot_normal
		}
		rifle_cooldown = room_speed * (interval+increase_cooldown) * global.shootingIntervalMultiplier;
		
		var _reload_total_frames = sprite_get_number(spr_rifle_reload)
		var _reload_fps = _reload_total_frames / (max(0.3,(interval+increase_cooldown)*global.shootingIntervalMultiplier))
		sprite_set_speed(spr_rifle_reload, _reload_fps, spritespeed_framespersecond)
		
		_reload = true
		increase_damage = 0
		increase_cooldown = 0
		pressed = false
		bullet_speed = 13
		rifle_timer = 0
		
	}
	
}



//if(shotgun_cooldown != 0){
if(sprite_index == spr_rifle_shoot_normal || sprite_index == spr_rifle_shoot_max) 
         && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	sprite_index = spr_rifle_reload;
}

if(sprite_index == spr_rifle_reload) && (image_index >= (sprite_get_number(sprite_index) - 1) ){
	sprite_index = spr_rifle
	_reload = false;
}

/*
if(rifle_cooldown > 0){
	rifle_cooldown = max(0,rifle_cooldown-1);
}
