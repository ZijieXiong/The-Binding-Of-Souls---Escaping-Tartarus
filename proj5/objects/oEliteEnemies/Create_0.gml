/// @description Insert description here
// You can write your code in this editor
event_inherited();
_health = 200 + 50 * global.currLevel;
health_bar = instance_create_layer(display_get_gui_width() / 2, 20, "UI_Layer", obj_elite_health_bar);
health_bar.enemy = self;
health_bar.max_health = _health;