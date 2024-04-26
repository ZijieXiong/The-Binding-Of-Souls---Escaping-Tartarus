if(_health <= 0){
	sprite_index = spr_teleport_dead
	audio_play_sound(enemyDie, 0, false);
	if((sprite_index == spr_teleport_dead) && (image_index >= (sprite_get_number(sprite_index) - 1))){
		instance_destroy()
	}
}

if(sprite_index == spr_teleport_attack || sprite_index == spr_teleport_in) && (image_index >= (sprite_get_number(sprite_index) - 1)){
	sprite_index = spr_teleport_idle
}
teleport_timer --
var dir = sign(obj_player.x - x)
_facing = dir

if (teleport_timer <= 0 and (sprite_index == spr_teleport_idle or sprite_index == spr_teleport_attack)){
	//repeat(15) {
		var temp_new_location_x = random_range(_currentRoom.x1 * CELL_SIZE,_currentRoom.x2 * CELL_SIZE)
		var temp_new_location_y = random_range(_currentRoom.y1 * CELL_SIZE,_currentRoom.y2 * CELL_SIZE)
	
		wall_there = collision_circle(temp_new_location_x,temp_new_location_y,teleport_radialBuffer,[obj_wall],true,0)
		if(wall_there == noone)
		{
			//new_location_x = temp_new_location_x
			//new_location_y = temp_new_location_y
			//sprite_index = spr_teleport_out
			//image_index = 0
			var tel_out = instance_create_layer(x,y,"Instances",obj_teleport_out)
			tel_out.target_x = temp_new_location_x
			tel_out.target_y = temp_new_location_y
			tel_out._health = _health
			tel_out._obj = oTeleportRobot
			tel_out._currentRoom = _currentRoom
			instance_destroy();
			
		}
		teleport_timer = 10
	//}
}else{
	if((sprite_index == spr_teleport_in) && (image_index >= (sprite_get_number(sprite_index) - 1))) 
		or sprite_index == spr_teleport_idle{
			shoot();
		}
}
/*
if(sprite_index == spr_teleport_out) && (image_index >= (sprite_get_number(sprite_index) - 1)){
		x=new_location_x;
		y=new_location_y;
		sprite_index = spr_teleport_in
		image_index = 0
	//	break;
}