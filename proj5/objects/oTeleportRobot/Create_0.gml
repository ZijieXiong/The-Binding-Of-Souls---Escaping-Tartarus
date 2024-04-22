event_inherited()

//_health = 50
_flash = 0

teleport_timer = irandom_range(room_speed*2, room_speed*4)

start_positionX = x
start_positionY = y
new_location_x = x
new_location_y = y
wall_there = noone
rangeTeleport = 150
teleport_radialBuffer = 20
attack_cooldown = 0;
_facing = 1
function shoot() {
	attack_cooldown +=1;
	if(attack_cooldown >= 30) {
		sprite_index = spr_teleport_attack
		image_index = 0
	    bullet = instance_create_layer(x, y, "Instances", oRobotBullet1);
	    bullet.speed = 4  + 0.1 * global.currLevel;
	    bullet.direction= point_direction(x, y, obj_player.x, obj_player.y);
	    bullet.image_angle = bullet.direction;
	    attack_cooldown = 0;
		
	}
}
