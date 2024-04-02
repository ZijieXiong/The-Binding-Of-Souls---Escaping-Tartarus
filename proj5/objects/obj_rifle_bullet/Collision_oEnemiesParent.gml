var enemyInstance = other.id;

if(ds_list_find_index(hitEnemies, enemyInstance) == -1){
	var dmg = damage * global.dmgMultiplier;
	var _instance = instance_create_layer(x,y,"UI_Layer", obj_damage_number);
	_instance.damage = dmg;
	ds_list_add(hitEnemies, enemyInstance);
	with(other){
		_flash = 1;
		_health -= dmg;
	}
}



if(!_rifflePenetrate){
	instance_destroy();
}
