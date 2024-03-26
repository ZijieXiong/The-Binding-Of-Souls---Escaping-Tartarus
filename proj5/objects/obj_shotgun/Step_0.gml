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
if(!_reload){
		_reload = true
		audio_play_sound(laserShoot, 0, false);
		sprite_index = spr_shotgun_shooting;
		var destination_x = obj_player.x;
	    var destination_y = obj_player.y;
	    show_debug_message("shotgun attack");
		var angle_increment = 90 / (shotgun_bulletcount);
		for (var _bullet = 0; _bullet < shotgun_bulletcount; _bullet++){
		   var _shotgun_shell = instance_create_layer(x+lengthdir_x(20,direction),y+lengthdir_y(20,direction),"Instances",obj_shotgun_bullet);
		   with (_shotgun_shell)
           {
			   var dir = point_direction(x , y, 
						mouse_x, mouse_y);

			   if(_bullet == 0){
			   	   _shotgun_shell.direction = dir  
			   }
			    if(_bullet == 1){
			       _shotgun_shell.direction = dir + 20  
			   }else if(_bullet == 2){
				   _shotgun_shell.direction = dir- 20 
			   }else{
					_shotgun_shell.direction = dir + random_range(-20, 20)
			   }
		       _shotgun_shell.speed = 13;
		       _shotgun_shell.image_angle = _shotgun_shell.direction;
            }
		}

		shotgun_cooldown = room_speed * interval;
	}
}

var _reload_total_frames = sprite_get_number(spr_shotgun_reload)
var _reload_fps = _reload_total_frames / (interval)
sprite_set_speed(spr_shotgun_reload, _reload_fps, spritespeed_framespersecond)

//if(shotgun_cooldown != 0){
if(sprite_index == spr_shotgun_shooting) && (image_index >= (sprite_get_number(sprite_index) - 1))
{
	sprite_index = spr_shotgun_reload;
}
//	shotgun_cooldown-=1;
//}

if(sprite_index == spr_shotgun_reload) && (image_index >= (sprite_get_number(sprite_index) - 1) ){
	sprite_index = _default_image
	_reload = false;
}