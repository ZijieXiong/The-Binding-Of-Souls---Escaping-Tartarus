var dmg = _damage * global.dmgMultiplier;
var _instance = instance_create_layer(x,y,"UI_Layer", obj_damage_number);
_instance.damage = dmg;
sprite_index = spr_missile_hit
image_index = 0
speed = 0
with(other){
	_flash = 1;
	_health -= dmg
}