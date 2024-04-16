/// @description Insert description here
// You can write your code in this editor
enemy_type = noone;
_current_room = noone;
function openPortal()
{
	sprite_set_speed(spr_enemy_portal_open, 8, spritespeed_framespersecond);
	sprite_index = spr_enemy_portal_open;
}


function createEnemy(){
	//show_debug_message("creating " + string(enemy_type));
	var _monster = instance_create_layer(x,y,"Dungeon",enemy_type);
	_monster._currentRoom = _current_room
	sprite_set_speed(spr_enemy_portal_close, 8, spritespeed_framespersecond);
	sprite_index = spr_enemy_portal_close;
	image_index = 0;
}