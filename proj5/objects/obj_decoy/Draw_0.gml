/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,0,x,y,0.8,0.8,0,c_white,1)


if( _flash > 0 )
{
	gpu_set_blendmode(bm_add);
	_flash -= 0.05;
	shader_set(shd_flash);
	var shd_alpha = shader_get_uniform(shd_flash,"_alpha");
	shader_set_uniform_f(shd_alpha, _flash);
	
	draw_sprite_ext(sprite_index,0,x,y,0.8,0.8,0,c_white,1)
	
	
	shader_reset();
	gpu_set_blendmode(bm_normal);
	
}
