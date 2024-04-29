
if(sprite_index == spr_missile_hit) && (image_index >= (sprite_get_number(sprite_index) - 1)){
	instance_destroy();
}

if(sprite_index = spr_missile_nor){
if !closest_enemy {
	if !_setDir{
		direction = point_direction(_obj_player.x,_obj_player.y,mouse_x,mouse_y)
		self.image_angle = direction
		speed = _speed
		_setDir = true
	}

}else{
	self.image_angle = point_direction(x,y,closest_enemy.x,closest_enemy.y)
	move_towards_point(closest_enemy.x,closest_enemy.y,_speed);

}
}


