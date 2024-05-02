/// @description Insert description here
// You can write your code in this editor
var i = 0;

var _scale_z = 3;
repeat(image_number) { 
	
	var _delta_y = _scale_z*i;
	var _j = 0;
	repeat(_scale_z) {
		draw_sprite_ext(sprite_index, i, x, y-_delta_y-_j ,image_xscale  ,image_yscale ,image_angle ,image_blend ,image_alpha );
		_j++;
	}
   //draw_sprite_ext(sprite_index, i, x, y-i ,image_xscale  ,image_yscale ,image_angle ,image_blend ,image_alpha );
   
   //draw_sprite_ext(sprite_index, i, x, y-_delta_y-1 ,image_xscale  ,image_yscale ,image_angle ,image_blend ,image_alpha );
   //draw_sprite_ext(sprite_index, i, x, y-i-1 ,image_xscale  ,image_yscale ,image_angle ,image_blend ,image_alpha );
   i ++;


}

/*


var i=0;
repeat(image_number) { 
	
	draw_sprite_ext(sprite_index, i, x, y-i ,image_xscale  ,image_yscale ,image_angle ,image_blend ,image_alpha );
   
   i ++;


}

*/