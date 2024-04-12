/// @description Insert description here
// You can write your code in this editor
if(sprite_index == spr_enemy_portal_open) && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	sprite_set_speed(spr_enemy_portal_idle, 8, spritespeed_framespersecond);
	sprite_index = spr_enemy_portal_idle;
	image_index = 0;
}

else if(sprite_index == spr_enemy_portal_idle) && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	createEnemy();
}

else if(sprite_index == spr_enemy_portal_close) && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	instance_destroy();
}