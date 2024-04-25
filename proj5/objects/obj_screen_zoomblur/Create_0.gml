/// @description Insert description here
// This is from https://gamemaker.io/en/tutorials/coffee-break-tutorials-juicy-screenshake-gml
is_effected = false;
effect_time = 0;
effect_mag = 0.5;
effect_radius = 0;
effect_fade = 0.2;
effect_target_obj = noone;

blur_lay_id = layer_get_id("Zoom_Blur_Effect");
blur_fx = layer_get_fx("Zoom_Blur_Effect");
blur_fx_param = fx_get_parameter(blur_fx,"Zoom_Blur_Effect" );
layer_set_visible(blur_lay_id, false);

/*
https://manual.gamemaker.io/monthly/en/The_Asset_Editors/Room_Properties/FX/All_Filter_Effect_Types.html
g_ZoomBlurCenter (Array)
g_ZoomBlurIntensity (Real)
g_ZoomBlurFocusRadius (Real)
g_ZoomBlurTexture (Sampler)

*/

set_params = function()
{
	fx_set_parameter(blur_fx, "g_ZoomBlurIntensity",effect_mag);
	fx_set_parameter(blur_fx, "g_ZoomBlurFocusRadius",effect_radius);
}



get_screen_coord = function(_x, _y)
{
	/*
	show_debug_message("xview : "+string(view_xview[0]));
	show_debug_message("yview : "+string(view_yview[0]));
	show_debug_message("hview : "+string(view_hview[0]));
	show_debug_message("wview : "+string(view_wview[0]));
	show_debug_message("hport : "+string(view_hport[0]));
	show_debug_message("wport : "+string(view_wport[0]));
	*/
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	//draw_circle(_x, _y, 30, 0);
	//draw_circle(_vx, _vy, 30, 0);
	
	return [(_x - _vx)/camera_get_view_width(view_camera[0]), (_y - _vy)/camera_get_view_height(view_camera[0])];	
}