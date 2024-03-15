for (j = 0; j < length_laser; j++ )  {
    var flicker = random_range(0.6,1.4); // change to make diffrent flicker, or delete flicker and set y_scale back to 1
  
    // variables set in create to ajust to need!
    draw_sprite_ext(whatImage, 0, x + lengthdir_x(j, direction), 
	y + lengthdir_y(j, direction), 1, flicker, direction,c_white, 1 );

}