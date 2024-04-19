x = obj_player.x
y = obj_player.y

if(_timer < _duration){
	obj_player._hasShield = true
	_timer += 1
}else{
	_timer = 0
	obj_player._hasShield = false
	instance_destroy()
}