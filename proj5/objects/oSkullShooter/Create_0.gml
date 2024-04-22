/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
_health = 50 + global.currLevel * 10;

shooting = false;
shoot_countdown = 90 - 2 * global.currLevel
shoot_timer = 30 + random_range(-5,5);
current_frame = 0;
has_shoot = fasle;
sprite_index = spr_skull_idle;
image_speed = 0.5;