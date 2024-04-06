if (point_distance(obj_player.x, obj_player.y, x, y) < ENEM_DISTANCE) {
	playerInRange = true;
}

if (playerInRange) {
	//alarm[0] = 0; // Start spawning bullets the next step;
	attack_cooldown += 1;
	if(attack_cooldown >= bulletSpiralInterval){
		shoot();
		//shoot(-1);
		attack_cooldown = 0;
	}
	direct_cooldown += 1;
	if(direct_cooldown >= bulletDirectInterval){
		shootAtPlayer();
		direct_cooldown = 0;
	}
}
else{
	bulletSpiralIterator = 0;
}

shoot = function() {
	var _inst = instance_create_layer(x,y,"Instances", oEnemBullet);
	if(bulletSpiralIterator == 0){
		initial_direction = point_direction(x,y,obj_player.x, obj_player.y);
		_inst.direction = initial_direction;
	}
	else{
		_inst.direction = (360/bulletSpiralCount) * bulletSpiralIterator + initial_direction;
	}
	_inst.speed = bulletSpiralSpeed;
	
	var _other_inst = instance_create_layer(x,y,"Instances", oEnemBullet);
	_other_inst.direction = (360/bulletSpiralCount) * bulletSpiralIterator + initial_direction + 180;
	_other_inst.speed = bulletSpiralSpeed;

	//shoot(); // Get ready to (potentially) spawn the next bullet
	bulletSpiralIterator++; // Increment the iterator
}

function shootAtPlayer()
{
	var _inst = instance_create_layer(x,y,"Instances", oEnemBullet);
	_inst.speed = bulletSpiralSpeed;
	_inst.direction = point_direction(x,y,obj_player.x, obj_player.y);
}

if(_health <= 0)
{
	die();
}

function die(){
	instance_destroy();
}
/*
if (turretLives <= 0) {
	chance = random(100);
	if (chance <= global.dropRate && dm.currLevel > 10) {
		powerup = instance_create_layer(x, y, "Instances", choose(oRichochet, oBomb));
	}
	instance_destroy();
}