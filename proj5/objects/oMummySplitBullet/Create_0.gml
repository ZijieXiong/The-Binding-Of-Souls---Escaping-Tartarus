split_self = function() {
	
	var _delta = 5;
	for(var _dir = 0; _dir < 360; _dir += 30;)
	{
		
		var _x = x + lengthdir_x(_delta, _dir);
		var _y = y + lengthdir_y(_delta, _dir);
		var _bullet = instance_create_layer(x, y, "Instances", oMummySplitBullet);
		_bullet.speed = 3  ;
		
		_bullet.direction= _dir;
		_bullet.image_angle = _bullet.direction;
		_bullet.image_xscale = 0.5;
		_bullet.image_yscale = 0.5;
	}
	
}