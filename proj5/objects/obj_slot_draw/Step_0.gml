
if keyboard_check(ord("1")){
if global.spr_inventory[0] != -1 {

	var _spr =  global.spr_inventory[0]
	var _obj =  global.obj_inventory[0]
	instance_create_layer(obj_player.x,obj_player.y,"Instances",_obj)
	global.spr_inventory[0] = -1
	global.obj_inventory[0] = -1
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
