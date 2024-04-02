playerLives = 3;
attack_cooldown = 0;
moveSpeed = 3;
grazeMeter = 0;

canBomb = false;

grazeDistance = 15;
bombDistance = 400;

bulletLimit = 3;

playerTimer = room_speed * 0.5

current_weapon = instance_create_layer(x,y,"Instances",obj_pistol)
current_weapon_arg = 1;

death_animation_started = false;
death_animation_timer = -1;

revive_animation_started = false;

function ChangeWeapon(arg){
	if arg == 1 {
		show_debug_message("pistol")
		instance_destroy(current_weapon)
		current_weapon = instance_create_layer(x,y,"Instances",obj_pistol)
		current_weapon_arg = 1;
	}
	else if arg == 2 {
		show_debug_message("shotgun")
		instance_destroy(current_weapon)
		current_weapon = instance_create_layer(x,y,"Instances",obj_shotgun)
		current_weapon_arg = 2;
	}
	else if arg == 3 {
		show_debug_message("rifle")
		instance_destroy(current_weapon)
		current_weapon = instance_create_layer(x,y,"Instances",obj_rifle)
		current_weapon_arg = 3
	}
	else if arg == 4{
		show_debug_message("laser")
		instance_destroy(current_weapon)
		current_weapon = instance_create_layer(x,y,"Instances",obj_laser)
	}
}
ChangeWeapon(0)
/*
_shotgun  = instance_create_layer(x,y,"Instances",obj_shotgun)
_pistol = instance_create_layer(x,y,"Instances",obj_pistol)
_rifle = instance_create_layer(x,y,"Instances",obj_rifle)
*/
function Revive(){
	show_debug_message("revived");
	playerLives = 3;
	global.revive-=1;
}