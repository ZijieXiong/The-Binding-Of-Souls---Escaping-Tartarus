if instance_exists(_enemy){
	x = _enemy.x 
	y = _enemy.y 
	show_debug_message(image_angle)
	depth = _enemy.depth - 1
}else{
	instance_destroy()
}

if image_index >= (sprite_get_number(sprite_index) - 1) {
	instance_destroy()
}