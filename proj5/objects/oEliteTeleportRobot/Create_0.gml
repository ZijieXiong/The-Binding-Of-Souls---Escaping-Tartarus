event_inherited()
image_xscale = 1.5
image_yscale = 1.5

_flash = 0

teleport_timer = irandom_range(room_speed*4, room_speed*6)

start_positionX = x
start_positionY = y
new_location_x = x
new_location_y = y
wall_there = noone
rangeTeleport = 150
teleport_radialBuffer = 20
attack_cooldown = 0;
_facing = 1
_shoot_count = 0
function shoot() {
	attack_cooldown +=1;
	if(attack_cooldown >= 20 and _shoot_count < 3) {
		_shoot_count+= 1
		sprite_index = spr_teleport_attack
		if(sprite_index != spr_teleport_attack){
			image_index = 0
		}
		repeat(4){
			bullet = instance_create_layer(x, y, "Instances", oRobotBullet1);
		    bullet.speed = 5  + 0.1 * global.currLevel;
		    bullet.direction= point_direction(x, y, obj_player.x, obj_player.y) + irandom_range(-60,60);
		    bullet.image_angle = bullet.direction;
		}
		attack_cooldown = 0;
		if(_shoot_count>=3){
			show_debug_message("dm")
			alarm[0] = room_speed * 1.5
		}
	}


}
