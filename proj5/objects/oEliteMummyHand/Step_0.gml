/// @description Insert description here
// You can write your code in this editor
/*if(!returning){
	angle += spiral_speed * rotation_direction;
	distance += spiral_speed;
	if(distance >= max_distance){
		returning = true;
	}
}
else{
	angle += spiral_speed * rotation_direction;
	distance -= spiral_speed;
	if(distance <= 0){
		distance = 0;
		angle = 180;
		returning = false;
	}
}*/
var full_circle = 360;
var period = full_circle;

if(is_left_hand){
	angle = (angle + spiral_speed * rotation_direction) mod period;

	distance = (cos(degtorad(angle)) * 0.5 + 0.5) * max_distance;


	x = owner_id.x + lengthdir_x(distance,angle) - 32;
	y = owner_id.y - lengthdir_y(distance,angle);

	image_angle = -angle + 90;
}
else{
	angle = (angle + spiral_speed * rotation_direction) mod period;

	distance = (cos(degtorad(angle)) * 0.5 + 0.5) * max_distance;


	x = owner_id.x - lengthdir_x(distance,angle) + 32;
	y = owner_id.y + lengthdir_y(distance,angle);

	image_angle = -angle - 90;
}
