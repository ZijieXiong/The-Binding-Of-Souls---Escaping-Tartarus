event_inherited();
_moveSpeed = 1;
attack_cooldown = 0;
trackerShooterLives = 3;

self.image_xscale = 0.7;
self.image_yscale = 0.7;

//_health = 50 + global.currLevel * 10;
_attack_dis = 100
dm = instance_find(oDungeon, 0);

function shoot() {
	attack_cooldown +=1;
	if(attack_cooldown >= 60) {
	    bullet = instance_create_layer(x, y, "Instances", oBeeBullet);
	    bullet.speed = 5  + 0.1 * global.currLevel;
	    bullet.direction= point_direction(x, y, obj_player_main.x, obj_player_main.y);
	    bullet.image_angle = bullet.direction;
	    attack_cooldown = 0;
	}
}

