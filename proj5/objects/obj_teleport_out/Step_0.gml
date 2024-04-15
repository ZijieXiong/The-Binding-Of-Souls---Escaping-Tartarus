if (image_index >= (sprite_get_number(sprite_index) - 1)){
	var tel_in = instance_create_layer(target_x,target_y,"Instances",obj_teleport_in)
	tel_in._health = _health
	tel_in._obj = _obj
	tel_in._currentRoom = _currentRoom
	instance_destroy()
}