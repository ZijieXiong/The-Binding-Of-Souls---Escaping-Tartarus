if (point_distance(obj_player.x, obj_player.y, x, y) > _attack_dis) {
	self.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
	sprite_index = spr_bee_attack
	//move_towards_point(obj_player.x, obj_player.y, trackShooterSpeed);
	var _found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player.x,obj_player.y,choose(0,1))
	if _found_player{
		path_start(path,trackShooterSpeed,path_action_stop,false)
	}
	shoot();
}else{
	path_end();
	self.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
	shoot();
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
