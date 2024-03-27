playerLives = 3;
attack_cooldown = 0;
moveSpeed = 3;
grazeMeter = 0;

canBomb = false;

grazeDistance = 15;
bombDistance = 400;

bulletLimit = 3;

playerTimer = room_speed * 0.5

window_set_cursor(cr_none)
cursor_sprite = spr_cursor

current_weapon = instance_create_layer(x,y,"Instances",obj_pistol)

function ChangeWeapon(arg){
	if arg == 1 {
		show_debug_message("pistol")
		instance_destroy(current_weapon)
		current_weapon = instance_create_layer(x,y,"Instances",obj_pistol)
	}
	else if arg == 2 {
		show_debug_message("shotgun")
		instance_destroy(current_weapon)
		current_weapon = instance_create_layer(x,y,"Instances",obj_shotgun)
	}
	else if arg == 3 {
		show_debug_message("rifle")
		instance_destroy(current_weapon)
		current_weapon = instance_create_layer(x,y,"Instances",obj_rifle)
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

