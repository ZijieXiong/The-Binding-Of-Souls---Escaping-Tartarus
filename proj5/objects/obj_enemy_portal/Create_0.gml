/// @description Insert description here
// You can write your code in this editor
enemy_type = noone;

function openPortal()
{
	sprite_set_speed(spr_enemy_portal_open, 8, spritespeed_framespersecond);
	sprite_index = spr_enemy_portal_open;
}


function createEnemy(){
	//show_debug_message("creating " + string(enemy_type));
	instance_create_layer(x,y,"Dungeon",enemy_type);
	sprite_set_speed(spr_enemy_portal_close, 8, spritespeed_framespersecond);
	sprite_index = spr_enemy_portal_close;
	image_index = 0;
}