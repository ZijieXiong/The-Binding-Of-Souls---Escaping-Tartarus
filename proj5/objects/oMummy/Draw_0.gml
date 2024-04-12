/// @description Insert description here
// You can write your code in this editor

var _curr_LUT = spr_LUT_identity;

//if keyboard_check(ord("L")){
//	_curr_LUT = spr_LUT_winter;
//}

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
	draw_self();
	shader_reset();
}
else show_debug_message("Shader failed");