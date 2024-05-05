x = _obj_player.x
y = _obj_player.y

if(_timer < _duration){
	_obj_player._hasShield = true
	_timer += 1
	if(_timer > room_speed * 3){
		if _xscale == 0 _xscale = 1
		else _xscale = 0
	}
}else{
	_timer = 0
	_obj_player._hasShield = false
	instance_destroy()
}