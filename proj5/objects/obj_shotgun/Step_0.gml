#region Inputs
shoot = mouse_check_button(mb_left);
#endregion

x = obj_player.x;
y = obj_player.y;
direction = point_direction(x,y,mouse_x,mouse_y);

if (direction > 90) && (direction < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;
depth = obj_player.depth-1;





if (shoot) {
if(shotgun_cooldown == 0){
		audio_play_sound(laserShoot, 0, false);
		var destination_x = obj_player.x;
	    var destination_y = obj_player.y;
	    show_debug_message("shotgun attack");
		var angle_increment = 180 / (shotgun_bulletcount);
		for (var _bullet = 0; _bullet < shotgun_bulletcount; _bullet++){
		   var _shotgun_shell = instance_create_layer(x+lengthdir_x(22,direction),y+lengthdir_y(22,direction),"Instances",obj_shotgun_bullet);
		   with (_shotgun_shell)
           {
			   if(_bullet % 2 != 0){
			       destination_x = destination_x + angle_increment*_bullet  //randomize bullet patch within 20 pixels of a straight line. change this to suit your needs
				   destination_y = destination_y + angle_increment*_bullet    //same as above    
			   }else if(_bullet % 2 == 0){
				   destination_x = destination_x - angle_increment*_bullet  //randomize bullet patch within 20 pixels of a straight line. change this to suit your needs
				   destination_y = destination_y - angle_increment*_bullet    //same as above    
			   	    
			   }
			   _shotgun_shell.direction= point_direction(destination_x, destination_y, 
						mouse_x, mouse_y);
		       _shotgun_shell.speed = 13;
		       _shotgun_shell.image_angle = _shotgun_shell.direction;
            }
		}
		with(obj_player){
			vx -= lengthdir_x(other.recoil_push,other.direction);
			vy -= lengthdir_y(other.recoil_push,other.direction); 
		}
		shotgun_cooldown = room_speed * interval;
	}
}

if(shotgun_cooldown != 0){
	shotgun_cooldown-=1;
}
