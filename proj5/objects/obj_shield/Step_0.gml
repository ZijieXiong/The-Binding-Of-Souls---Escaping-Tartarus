x = obj_player.x
y = obj_player.y

if(_timer < _duration){
	_timer += 1
}else{
	_timer = 0
	instance_destroy()
	obj_player._hasShield = false
}