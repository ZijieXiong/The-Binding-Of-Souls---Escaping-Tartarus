


var enemyInstance = other.id;

if(ds_list_find_index(hitEnemies, enemyInstance) == -1){
	ds_list_add(hitEnemies, enemyInstance);
	var dmg = _damage * global.dmgMultiplier;
	var _instance = instance_create_layer(x,y,"UI_Layer", obj_damage_number);
	_instance.damage = dmg;
	self.sprite_index = spr_missile_hit
	self.image_index = 0
	self.speed = 0
	with(other){
		_flash = 1;
		_health -= dmg;
	}
}