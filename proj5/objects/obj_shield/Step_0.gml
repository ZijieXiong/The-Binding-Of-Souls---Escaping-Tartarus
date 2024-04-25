x = obj_player.x
y = obj_player.y

if(_timer < _duration){
	obj_player._hasShield = true
	_timer += 1
	if(_timer > room_speed * 2){
		if _xscale == 0 _xscale = 1
		else _xscale = 0
	}
}else{
	_timer = 0
	obj_player._hasShield = false
	instance_destroy()
}