/// @description Insert description here
// You can write your code in this editor


if (shader_is_compiled(shd_tonemap))
{
	
	
	
	var _LUT_sampler = shader_get_sampler_index(shd_tonemap, "LUTSampler");
	var _LUT_tex = sprite_get_texture(spr_LUT_winter, 0);

	shader_set(shd_tonemap);
	texture_set_stage(_LUT_sampler, _LUT_tex);
	draw_self();
	shader_reset();
}
else show_debug_message("Shader failed");