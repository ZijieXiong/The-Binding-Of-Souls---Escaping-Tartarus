event_inherited();

translation += speed;

if(_shotgun_split) && translation >= (max_trans / 2){
	instance_destroy();
	var bullet1 = instance_create_layer(x,y,"Instances",obj_shotgun_bullet);
	var bullet2 = instance_create_layer(x,y,"Instances",obj_shotgun_bullet);
	bullet1.direction = direction + global.split_angel;
	bullet2.direction = direction - global.split_angel;
	bullet1.speed = global.bulletSpeed;
	bullet2.speed = global.bulletSpeed;
	
}

if(translation >= max_trans)
{
		instance_destroy();
}
/*
if (global.richochet) {
	show_debug_message(string(timer));
	if (timer > 0) {timer--;}

	if (timer == 0)
	{
	 instance_destroy();
	 timer = -1; // This is important, or the timer will trigger every step once it runs out
	}
	
	else {
			move_bounce_solid(true);
	}
}

else {
	if (place_meeting(x, y, [obj_wall])) {
		instance_destroy();
	}

}

//if (x > room_width) {
//    instance_destroy();
//}

if (place_meeting(x, y, [oTracker, oTurret])) {
	instance_destroy();
}

