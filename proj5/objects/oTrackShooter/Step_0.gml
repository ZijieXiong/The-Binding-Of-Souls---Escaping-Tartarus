if (point_distance(obj_player.x, obj_player.y, x, y) < ENEM_DISTANCE) {
	self.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
	sprite_index = spr_bee_attack
	//move_towards_point(obj_player.x, obj_player.y, trackShooterSpeed);
	var _found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player.x,obj_player.y,choose(0,1))
	if _found_player{
		path_start(path,trackShooterSpeed,path_action_stop,false)
	}
	shoot();
}else{
	sprite_index = spr_bee_idle
}

function shoot() {
	attack_cooldown +=1;
	if(attack_cooldown >= 60) {
	    bullet = instance_create_layer(x, y, "Instances", oBeeBullet);
	    bullet.speed = 5  + 0.1 * global.currLevel;
	    bullet.direction= point_direction(x, y, obj_player.x, obj_player.y);
	    bullet.image_angle = bullet.direction;
	    attack_cooldown = 0;
	}
}

if(_health <= 0)
{
	die();
}

function die(){
	instance_destroy();
}

/*
if (trackerShooterLives <= 0) {
	chance = random(100);
	if (chance <= global.dropRate && dm.currLevel > 10) {
		powerup = instance_create_layer(x, y, "Instances", choose(oRichochet, oBomb));
	}
	instance_destroy();
}
