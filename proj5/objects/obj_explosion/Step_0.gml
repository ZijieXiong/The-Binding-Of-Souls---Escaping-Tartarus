
_target = collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,oEnemiesParent,0,0,_target_list,0)

if _target > 0{
	if(_takedameage == false){
		_takedameage  = true
		for(var i = 0; i < _target;++i;){
			var dmg = damage+40;
			_target_list[| i]._flash = 1;
			_target_list[| i]._health -= dmg;
			var _instance = instance_create_layer(_target_list[| i].x,_target_list[| i].y,"UI_Layer", obj_damage_number);
			_instance.damage = dmg;
		}
	}
}

