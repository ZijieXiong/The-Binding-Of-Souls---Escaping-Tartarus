/// @description Insert description here
// You can write your code in this editor
if (is_effected) 
{ 
	
	effect_time -= 1; 
   
   var _x = 0.5;
   var _y = 0.5;
   if(instance_exists(effect_target_obj))
   {
	   
	   var _coord = get_screen_coord(effect_target_obj.x, effect_target_obj.y);
	   _x = _coord[0];
	   _y = _coord[1];
   }
	// _x = 0.1;
	//_y = 0.5;
	//show_debug_message(string(_x)+", "+string(_y));
	
	fx_set_parameter(blur_fx, "g_ZoomBlurCenter", [_x,_y]);
	 
	
	layer_set_visible(blur_lay_id, true);
   if (effect_time <= 0) 
   { 
      effect_mag -= effect_fade; 

      if (effect_mag <= 0) 
      { 
         //set inv
         is_effected = false; 
		 layer_set_visible(blur_lay_id, false);
      } 
   } 
}