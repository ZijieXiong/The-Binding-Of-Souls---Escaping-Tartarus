x = obj_player_main.x + lengthdir_x(26, direction)
y = obj_player_main.y + lengthdir_y(26, direction);


direction = point_direction(obj_player_main.x,obj_player_main.y,mouse_x,mouse_y)

var max_length = 200

for (i = 0; i < max_length; i++ ) {

   xEnd = x + lengthdir_x(i, direction);
   yEnd = y + lengthdir_y(i, direction);
  
   length_laser = i;   // how long the laser is in the end
  
   // breaking point change here object to break to or add multiple breaking points
    if (collision_point(xEnd, yEnd, [obj_wall],0,1)) {

		break; // stops loop and sets new xEnd and yEnd values
    }
  
} 


#endregion


#region    collision  -> with global enemy to change its values (hp or something)

 if (instance_exists(oEnemiesParent)) {
	
      // add
      if (refresh_hit == true) { refresh_hit = false;
    
      var _list = ds_list_create();
      var hits = collision_line_list(x,y, xEnd, yEnd, oEnemiesParent, 0,0, _list,0 );
		
         if (hits > 0 ) {
        show_debug_message(_list)
               for (var k = 0; k < hits; ++k;) {
                 // show_debug_message(_list[| k]._health)
                 //  _list[| k]._health = _list[| k]._health - damage;
				 //  _list[| k]._flash = 1
					with(_list[| k]){
						_flash = 1;
						show_debug_message(_health)
						_health -= other.damage * global.dmgMultiplier;
						if _health <= 0 {
							instance_destroy();
						}
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
