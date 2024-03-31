#region Inputs
shoot = mouse_check_button(mb_left);
#endregion

x = obj_player.x;
y = obj_player.y;
direction = point_direction(x,y,mouse_x,mouse_y);

if (direction > 90) && (direction < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;
depth = obj_player.depth-1;




if (shoot) {
	if(pistol_cooldown == 0){
		audio_play_sound(laserShoot, 0, false);
		sprite_index = spr_pistol_shoot
		var bullet = instance_create_layer(x+lengthdir_x(5,direction),y+lengthdir_y(5,direction), "Instances", obj_pistol_bullet);
		bullet.speed = global.bulletSpeed;
		bullet.direction= point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
		bullet.image_angle = bullet.direction;
		pistol_cooldown = room_speed * interval * global.shootingIntervalMultiplier;
	}
}


if(pistol_cooldown != 0){
	pistol_cooldown = max(0,pistol_cooldown-1);
}


if(sprite_index == spr_pistol_shoot) && (image_index >= (sprite_get_number(sprite_index) - 1) ){
	sprite_index = spr_pistol
	_reload = false;
}
