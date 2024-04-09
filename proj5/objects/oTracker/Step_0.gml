//var test = (point_distance(obj_player.x, obj_player.y, x, y));
//show_debug_message(string(test));
if (point_distance(obj_player.x, obj_player.y, x, y) < ENEM_DISTANCE) {
	//self.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
	_facing = sign(x-xp)
	if _facing == 0 _facing = previous_facing
	show_debug_message(_facing)
	move_towards_point(obj_player.x, obj_player.y, trackerSpeed);
	//track();

}
else {
	speed = 0;
}

if(_health <= 0)
{
	die();
}

function die(){
	instance_destroy();
}
xp = x
yp = y
previous_facing = _facing
/*
if (trackerLives <= 0) {
	chance = random(100);
	if (chance <= global.dropRate && dm.currLevel > 10) {
		powerup = instance_create_layer(x, y, "Instances", choose(oRichochet, oBomb));
	}
	instance_destroy();
}