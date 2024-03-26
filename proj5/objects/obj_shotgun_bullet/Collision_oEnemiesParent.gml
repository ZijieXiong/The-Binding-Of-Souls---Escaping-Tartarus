var dmg = damage * global.dmgMultiplier;
var _instance = instance_create_layer(x,y,"UI_Layer", obj_damage_number);
_instance.damage = dmg;

with(other){
	_flash = 1;
	show_debug_message(_health)
	_health -= dmg;
	if _health <= 0 {
	instance_destroy();
	}
}
instance_destroy();