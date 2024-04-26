/// @description Insert description here
// You can write your code in this editor
self.image_angle = point_direction(x, y, obj_player.x, obj_player.y) + 90;
if(!shooting && _health>0){
	if(shoot_timer > 0){
		shoot_timer--;
	}
	else{
		shooting = true;
		shoot_timer = shoot_countdown + random_range(-10,10);
		sprite_index = spr_skull_shoot;
		current_frame = 0;
		image_index = 0;
		image_speed = 1;
	}
}


if(shooting && sprite_index == spr_skull_shoot)
{
	if(floor(image_index) == 9 && !has_shoot)
	{
		var dir = point_direction(x,y,obj_player.x,obj_player.y);
		var bullet_speed = 4;
		var bullet_spread = 30;
		has_shoot = true;
		
		 for (var i = -1; i <= 1; i++) {
            var bullet = instance_create_layer(x, y, "Instances", oEnemBullet);
            bullet.direction = dir + (i * bullet_spread);
            bullet.speed = bullet_speed;
        }
	}
	else if(image_index >= sprite_get_number(sprite_index)-1)
	{
		sprite_index = spr_skull_idle;
		image_speed = 0.5;
		image_index = 0;
		shooting = false;
		has_shoot = false;
	}
}

if(_health <= 0 && sprite_index != spr_skull_death) 
{
	sprite_index = spr_skull_death;
	image_index = 0;
    image_speed = 0.5;
    shooting = false;
    shoot_timer = -1;
}

if (sprite_index == spr_skull_death && image_index >= sprite_get_number(spr_skull_death) - 1) {
    audio_play_sound(enemyDie, 0, false);
	instance_destroy();
    exit;
}