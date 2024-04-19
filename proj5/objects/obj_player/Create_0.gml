healthLimit = 5;
playerLives = 5;
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

is_vulnerable = true;
invulnerable_time_after_damage =1;
_hasShield = false;

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
	ds_map_replace(global.upgrade_pool, "obj_upgrade_revive", 5);
}

_last_sprite = sprite_index
_hurting = false
function TakeDamage(){
	if(is_vulnerable)
	{
		if(!_hasShield){
			sprite_index = spr_player_hurt
			if _last_sprite != spr_player_hurt{
				image_index = 0
			}
			var _hurt_total_frames = sprite_get_number(spr_player_hurt)
			var _hurt_fps = _hurt_total_frames / (invulnerable_time_after_damage);
			show_debug_message(_hurt_fps)
			sprite_set_speed(spr_player_hurt, _hurt_fps, spritespeed_framespersecond)
			_hurting = true
			playerLives -= 1;
			audio_play_sound(hitHurt, 0, false);
		}

		is_vulnerable = false;
		alarm[0] = invulnerable_time_after_damage * 60;
	}
}

function Heal(healthHealed)
{
	playerLives += healthHealed;
	if(playerLives >= healthLimit){
		playerLives = healthLimit;
	}
}

is_summon_elite = false;
