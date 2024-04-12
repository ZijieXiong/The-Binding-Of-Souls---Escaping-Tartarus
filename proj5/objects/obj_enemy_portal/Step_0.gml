/// @description Insert description here
// You can write your code in this editor
if(sprite_index == spr_enemy_portal_open) && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	createEnemy();
}

if(sprite_index == spr_enemy_portal_close) && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	instance_destroy();
}