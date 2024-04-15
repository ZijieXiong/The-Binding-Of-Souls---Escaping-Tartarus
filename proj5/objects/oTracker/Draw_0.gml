
draw_sprite_ext(sprite_index,image_index,x,y,_facing,1,0,c_white,1)
if keyboard_check(ord("Q")){
	draw_path(path,x,y,false)
}
 
if( _flash > 0 )
{
	gpu_set_blendmode(bm_add);
	_flash -= 0.05;
	shader_set(shd_flash);
	var shd_alpha = shader_get_uniform(shd_flash,"_alpha");
	shader_set_uniform_f(shd_alpha, _flash);
	
	draw_sprite_ext(sprite_index,image_index,x,y,_facing,1,0,c_white,1)
	
	
	shader_reset();
	gpu_set_blendmode(bm_normal);
	
}

