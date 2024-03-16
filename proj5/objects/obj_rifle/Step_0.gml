/// @description Insert description here
// You can write your code in this editor

#region Inputs
shoot = mouse_check_button(mb_left);
#endregion

x = obj_player.x;
y = obj_player.y;
direction = point_direction(x,y,mouse_x,mouse_y);

if (shoot){
	rifle_timer += 1
	if(rifle_cooldown <= 0 && increase_damage < max_damage_increase && rifle_timer > room_speed*0.3){
	increase_damage += damage_increase_pre_frame
	increase_cooldown += cooldown_increase_pre_frame
	
	bullet_speed = 20
	show_debug_message(increase_damage)
	}
	pressed = true
}

if(increase_damage > max_damage_increase){
	increase_damage = max_damage_increase
}

if(mouse_check_button_released(mb_left)){
	if(rifle_cooldown <= 0){
		show_debug_message("fires")
		audio_play_sound(laserShoot, 0, false);
		var bullet = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_rifle_bullet);
	    bullet.speed = 13;
	    bullet.direction= point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	    bullet.image_angle = bullet.direction;
		bullet.damage += increase_damage;
		rifle_cooldown = room_speed * (interval+increase_cooldown);
		increase_damage = 0
		increase_cooldown = 0
		pressed = false
		bullet_speed = 13
		
		with(obj_player){
			vx -= lengthdir_x(other.recoil_push,other.direction);
			vy -= lengthdir_y(other.recoil_push,other.direction); 
		}
		
	}
	
}


if(rifle_cooldown > 0){
	rifle_cooldown-=1;
}
