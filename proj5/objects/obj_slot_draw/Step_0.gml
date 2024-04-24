if(global.spr_inventory[0] != -1){
	var _spr =  global.spr_inventory[0]
	var _obj =  global.obj_inventory[0]
	if _spr == spr_missle_pickup{
		var closest_enemy = instance_nearest(obj_player.x,obj_player.y,oEnemiesParent)
		if closest_enemy{
			var enemy_width = closest_enemy.sprite_width
			var ememy_hight = closest_enemy.sprite_height
			if !instance_exists(_aim){
				_aim = instance_create_layer(closest_enemy.x,closest_enemy.y,"Instances",obj_aim)
			}
				_aim.enemy = closest_enemy;
		}
	}
	if keyboard_check(ord("Q")){
		if !_usingItem{
			global.item_amount -= 1
			_usingItem = true
			alarm[0] = room_speed * 0.3
	//		var _spr =  global.spr_inventory[0]
	//		var _obj =  global.obj_inventory[0]
			instance_create_layer(obj_player.x,obj_player.y,"Instances",_obj)
			global.spr_inventory[0] = -1
			global.obj_inventory[0] = -1
			audio_play_sound(itemUse, 0, false);
			if _aim {

			}
		}
	}
}
if global.spr_inventory[0] == -1{
	move_item();
}


/*
if keyboard_check(ord("1")){
if global.spr_inventory[0] != -1 {



}
}


if keyboard_check(ord("2")){
if global.spr_inventory[1] != -1 {

	var _spr =  global.spr_inventory[1]
	var _obj =  global.obj_inventory[1]
	instance_create_layer(obj_player.x,obj_player.y,"Instances",_obj)
	global.spr_inventory[1] = -1
	global.obj_inventory[1] = -1
}
}


if keyboard_check(ord("3")){
if global.spr_inventory[2] != -1 {

	var _obj =  global.obj_inventory[2]
	instance_create_layer(obj_player.x,obj_player.y,"Instances",_obj)
	global.spr_inventory[2] = -1
	global.obj_inventory[2] = -1
}
}
