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
	if(pistol_cooldown == 0){
		audio_play_sound(laserShoot, 0, false);
		var bullet = instance_create_layer(x+lengthdir_x(5,direction),y+lengthdir_y(5,direction), "Instances", obj_pistol_bullet);
		bullet.speed = 13;
		bullet.direction= point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
		bullet.image_angle = bullet.direction;
		pistol_cooldown = room_speed * interval;
	}
}


if(pistol_cooldown != 0){
	pistol_cooldown-=1;
}

/*
x = obj_player.x;
y = obj_player.y;
direction = point_direction(x,y,mouse_x,mouse_y);

if (direction > 90) && (direction < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;

var mouseb;
if (automatic) mouseb = mouse_check_button(mb_left); else mouseb = mouse_check_button_pressed(mb_left);

if (mouseb)
{
	show_debug_message(name)
	if (current_cd == 0)
	{
		current_cd = cooldown;
		current_delay = startup;
	}
}


if (current_delay == 0) && (projectile != -1)
{
		var angle_increment = 180 / (bulletcount);
		for(var i = 0; i < bulletcount;i++){
			with (instance_create_layer(x+lengthdir_x(length,direction),y+lengthdir_y(length,direction),"Instances",projectile))
			{
				if(i % 2 == 0){
					direction = other.direction - 180 / (other.bulletcount) * i;
					speed = other.bulletspeed;
				}else{
					direction = other.direction + 180 / (other.bulletcount) * i;
					speed = other.bulletspeed;
				}
				
			}
		}

	
	/*
	with (obj_player)
	{
		vx -= lengthdir_x(other.recoil_push,other.direction);
		vy -= lengthdir_y(other.recoil_push,other.direction); 
	}
	current_recoil = recoil;
	
	
}

current_delay = max(-1,current_delay-1);
if (current_delay == -1) current_cd = max(0,current_cd-1);
current_recoil = max(0,floor(current_recoil*0.8));
*/


