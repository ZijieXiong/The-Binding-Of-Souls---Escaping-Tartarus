/// @description Insert description here
// You can write your code in this editor
if (is_poisoned) 
{ 
	
	poison_time -= 1; 
   
	hue_count++;
	fx_set_parameter(hue_fx, "g_HueShift",0.5+ 0.3 * sin(2*pi*hue_count/hue_T));
	 
	fx_set_parameter(distort_fx, "g_DistortOffset",[0.5+ 0.5 * sin(2*pi*hue_count/hue_T), hue_count/hue_T]);
	 
	//fx_set_parameter(distort_fx, "g_DistortAmount",poison_magnitude);
	layer_set_visible(hue_lay_id, true);
	layer_set_visible(distort_lay_id, true);
   if (poison_time <= 0) 
   { 
      poison_magnitude -= poison_fade; 

      if (poison_magnitude <= 0) 
      { 
         //set inv
         is_poisoned = false; 
		 layer_set_visible(hue_lay_id, false);
		 layer_set_visible(distort_lay_id, false);
      } 
   } 
}