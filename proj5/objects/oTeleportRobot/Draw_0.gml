

draw_sprite_ext(sprite_index,image_index,x,y,_facing,1,0,c_white,1)

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
var _curr_LUT = spr_LUT_identity;

if (shader_is_compiled(shd_tonemap))
{
	
	
	
	var _LUT_sampler = shader_get_sampler_index(shd_tonemap, "LUTSampler");
	//var _LUT_tex = sprite_get_texture(spr_LUT_winter, 0);
	var _LUT_tex = sprite_get_texture(_curr_LUT, 0);
	
	


	gpu_set_texfilter(true);
	shader_set(shd_tonemap);
	
	var _uvs = sprite_get_uvs( _curr_LUT, 0 );
	shader_set_uniform_f( shader_get_uniform( shd_tonemap, "u_vA" ), _uvs[0], _uvs[1], _uvs[2]-_uvs[0], _uvs[3]-_uvs[1] );
	
	
	texture_set_stage(_LUT_sampler, _LUT_tex);
	draw_sprite_ext(sprite_index,image_index,x,y,_facing,1,0,c_white,1)
	shader_reset();
}