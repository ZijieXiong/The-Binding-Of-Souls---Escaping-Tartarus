var dmg = damage * global.dmgMultiplier;
var _instance = instance_create_layer(x,y,"UI_Layer", obj_damage_number);
_instance.damage = dmg;

with(other){
	_flash = 1;
	show_debug_message(_health)
	_health -= other.damage * global.dmgMultiplier;
	audio_play_sound(enemyHurt, 0, false);
	
	hit_effect(x-lengthdir_x(5,other.direction),y-lengthdir_y(5,other.direction),other.damage);
}

instance_destroy();