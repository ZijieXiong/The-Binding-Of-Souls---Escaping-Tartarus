/// @description Insert description here
// You can write your code in this editor
x = obj_laser_drone.x
y = obj_laser_drone.y
depth = obj_laser_drone.depth - 1
if instance_exists(_enemy){
direction = point_direction(x,y,_enemy.x,_enemy.y);
var length = point_distance(x,y,_enemy.x,_enemy.y);
image_xscale = (length)  / sprite_get_width(texture_laser)
image_yscale = 0.2
}


image_angle = direction





#region    collision  -> with global enemy to change its values (hp or something)

 if (instance_exists(oEnemiesParent)) {
	
      // add
      if (refresh_hit == true) { refresh_hit = false;
    
      var _list = ds_list_create();
      var hits =collision_line_list(x,y, _enemy.x+lengthdir_x(10,direction),_enemy.y+lengthdir_y(10,direction), oEnemiesParent, 0,0, _list,0 );
		
         if (hits > 0 ) {
        show_debug_message(_list)
               for (var k = 0; k < hits; ++k;) {
                 // show_debug_message(_list[| k]._health)
                 //  _list[| k]._health = _list[| k]._health - damage;
				 //  _list[| k]._flash = 1
					with(_list[| k]){
						_flash = 1;
						_health -= other.damage * global.dmgMultiplier;
						audio_play_sound(enemyHurt, 0, false);
						var _instance = instance_create_layer(_list[| k].x,_list[| k].y,"UI_Layer", obj_damage_number);
						_instance.damage = other.damage * global.dmgMultiplier;
						var _dir = point_direction(x,y,other.x,other.y)
						part_particles_create(obj_par.particleSystem,_list[| k].x,_list[| k].y,obj_par.particle_hit,1)
						hit_effect(_list[| k].x,_list[| k].y,other.damage,_dir);
					}
               }
        }
     ds_list_destroy(_list);

     } // end of refresh check
 }  // end of enemy exist check




 //Memory save , "switch"
 if (refresh_hit == false) {
  refresh_hit_timer--;
  if (refresh_hit_timer <= 0) {   refresh_hit_timer = refresh_hit_time; refresh_hit = true;   }

                             }



#endregion