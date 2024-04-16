var enemyInstance = other.id;



if(ds_list_find_index(hitEnemies, enemyInstance) == -1){
	ds_list_add(hitEnemies, enemyInstance);
	if _explosive{
		var _explosive = instance_create_layer(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),"Instances",obj_explosion);
		_explosive.damage =  damage * global.dmgMultiplier;
	}else{
		var dmg = damage * global.dmgMultiplier;
		var _instance = instance_create_layer(x,y,"UI_Layer", obj_damage_number);
		_instance.damage = dmg;
	
		with(other){
			_flash = 1;
			_health -= dmg;
		}
	}

}


if(!global.rifflePenetrate){
	instance_destroy();
}
