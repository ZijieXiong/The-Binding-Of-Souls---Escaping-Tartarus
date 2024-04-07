/// @description Insert description here
// You can write your code in this editor

vx = 0;
vy = 0;
self.image_xscale = 1.25;
self.image_yscale = 1.25;
#region Inputs
if(!global.playerFreeze && !global.globalFreeze)
{
	sprite_index=spr_player_idle;
	if (keyboard_check(ord("W"))) {
		vy -= moveSpeed;
		sprite_index=spr_player_run;
	}
	if (keyboard_check(ord("S"))) {
		vy += moveSpeed;
		self.image_xscale = -1.25;
		sprite_index=spr_player_run;
	}
	if (keyboard_check(ord("A"))) {
		vx -= moveSpeed;
		self.image_xscale = -1.25;
		sprite_index=spr_player_run;
	}
	if (keyboard_check(ord("D"))) {
		vx += moveSpeed;
		sprite_index=spr_player_run;
	}

	var totalSpeed = point_distance(0, 0, vx, vy);
	if (totalSpeed > moveSpeed) {
	    vx = (vx / totalSpeed) * moveSpeed * global.playerSpeedMultiplier;
	    vy = (vy / totalSpeed) * moveSpeed * global.playerSpeedMultiplier;
	} else {
	    vx *= global.playerSpeedMultiplier;
	    vy *= global.playerSpeedMultiplier;
	}

	shoot = mouse_check_button(mb_left);
	bombInput = mouse_check_button(mb_right);

	if (keyboard_check_pressed(ord("1"))) ChangeWeapon(1);
	if (keyboard_check_pressed(ord("2"))) ChangeWeapon(2);
	if (keyboard_check_pressed(ord("3"))) ChangeWeapon(3);
	if (keyboard_check_pressed(ord("4"))) ChangeWeapon(4);
	
	//show_debug_message(obj_pistol.name);
	collisionTileIndex = 16;

	var nextX = x + vx;
	var nextY = y + vy;

	if (place_meeting(nextX, y, obj_wall)) {
	    vx = 0;
	}

	if (place_meeting(x, nextY, obj_wall)) {
	    vy = 0;
	}

	//normalize vector
	/*if (vx + vy > point_distance(0,0,vx,vy)) {
		vx *= moveSpeed/point_distance(0,0,vx,vy);
		vy *= moveSpeed/point_distance(0,0,vx,vy);
	}*/

	x += vx;
	y += vy;

	var halfWidth = sprite_get_width(sprite_index) / 2;
	var halfHeight = sprite_get_height(sprite_index) / 2;

	#endregion

	x = clamp(x, halfWidth, room_width - halfWidth);
	y = clamp(y, halfHeight, room_height - halfHeight);


	//self.image_angle = point_direction(x, y, mouse_x, mouse_y); remove rotate of the player
	// Flip sprite based on mouse position
	if (mouse_x < x) {
	    self.image_xscale = -1.25; // Flip to face left
	} else {
	    self.image_xscale = 1.25;  // Face right
	}
	
	if (playerLives <= 0) {
		//teleport to death limbo room
		if(!death_animation_started){
			instance_destroy(current_weapon);
			sprite_index = spr_player_death;
			image_index = 0;
			image_speed = 0.2;
			global.globalFreeze = true;
			death_animation_started = true;
		}
		//global.graze = false;
		//global.healthBoost = 0;
	}
}




//_shotgun.current_weapon = true
//var current_weapon =_pistol
//var current_weapon =_rifle


/*
if shoot {
	//audio_play_sound(laserShoot, 0, false);
	current_weapon.fire(x,y);
	//attack_cooldown +=1;
	//if(attack_cooldown >= 8 && instance_number(obj_bullet) < bulletLimit) {
	//    bullet = instance_create_layer(x, y, "Instances", obj_bullet);
	//    bullet.speed = 13;
	//    bullet.direction= point_direction(x, y, mouse_x, mouse_y);
	//    bullet.image_angle = bullet.direction;
	//    attack_cooldown = 0;
	//}
}
*/

function doGraze() {
	for (var i = 0; i < instance_number(oEnemBullet); ++i;) {
		currEnem = instance_find(oEnemBullet, i);
		if (point_distance(x, y, currEnem.x, currEnem.y) <= grazeDistance) {
			grazeMeter++;
		}
	}
	
	if (grazeMeter >= 100) {
		canBomb = true;
		grazeMeter = 100;
	}
}

function bomb() {
	if (playerTimer > 0) {

		for (var i = 0; i < instance_number(oEnemBullet); ++i;) {
			currEnem = instance_find(oEnemBullet, i);
			if (point_distance(x, y, currEnem.x, currEnem.y) <= bombDistance) {
				instance_destroy(currEnem.id);
			}
		}
		grazeMeter = 0;
		playerTimer--;
	}
		
	if (playerTimer == 0) {
		canBomb = false;
		playerTimer = -1;
	}
}


if(death_animation_started && image_index >= sprite_get_number(sprite_index) - 1){
	image_index = sprite_get_number(sprite_index) - 1;
	image_speed = 0;
	if(death_animation_timer == -1){
		death_animation_timer = room_speed;
	}
	else if(death_animation_timer > 0)
	{
		death_animation_timer -= 1;
	}
	else if(global.revive > 0)
	{
		global.revive -= 1;
		death_animation_started = false;
		revive_animation_started = true;
		death_animation_timer = -1;
		sprite_index = spr_player_revive;
		image_index = 0;
		image_speed = 0.2;
		show_debug_message("revive starts");
	}
	else
	{
		room_goto(rmGameOver);
	}
}

if(revive_animation_started && image_index >= sprite_get_number(sprite_index) - 1)
{
	playerLives = 3;
	global.globalFreeze = false;
	revive_animation_started = false;
	ChangeWeapon(current_weapon_arg);
	
}

/*
if (bombInput && canBomb) {
	playerTimer = room_speed * 0.5;
	bomb();
}

if (global.graze) {
	doGraze();
}
	*/
