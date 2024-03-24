with(other){
	_flash = 1;
	show_debug_message(_health)
	_health -= other.damage * global.dmgMultiplier;
	if _health <= 0 {
	instance_destroy();
	}
}
instance_destroy();