/// @description Insert description here
// You can write your code in this editor
is_open = true;
linked_room = noone;
close_timer = 1;
close_delay_active = false;
enemy_cleared = true;
elite_sound = noone;
open_sprite = spr_door_open;
close_sprite = spr_door;

function close()
{
	sprite_index = close_sprite;
}

function open()
{
	sprite_index = open_sprite;
}