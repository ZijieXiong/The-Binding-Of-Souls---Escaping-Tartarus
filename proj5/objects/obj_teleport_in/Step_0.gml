if (image_index >= (sprite_get_number(sprite_index) - 1)){
	var rob = instance_create_layer(x,y,"Instances",_obj)
	rob._health = _health
	rob._currentRoom = _currentRoom
	instance_destroy()
}