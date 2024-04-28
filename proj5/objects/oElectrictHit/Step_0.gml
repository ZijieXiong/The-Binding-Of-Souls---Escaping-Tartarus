if instance_exists(_enemy){
	x = _enemy.x - _xDiff
	y = _enemy.y - _yDiff
	depth = _enemy.depth - 1
}else{
	instance_destroy()
}