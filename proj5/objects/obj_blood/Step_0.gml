if instance_exists(_obj_player){
	x = _obj_player.x
	y = _obj_player.y
}else{
	instance_destroy()
}
if image_index >= (sprite_get_number(sprite_index) - 1) {
	instance_destroy()
}