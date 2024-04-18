/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, [obj_player])) {
	instance_destroy();
}

if (place_meeting(x, y, [obj_wall])) {
	explode();
}

explosion_radius = 50;

var _collision_res = collision_circle(x , y,  explosion_radius, obj_player, true, 1);

if(is_swelling && _collision_res) explode();


if(is_swelling)
{
	swell_count++;
	var _t = swell_count/swell_total_count;
	size_scale = lerp(stable_size_scale, final_size_scale, easeOutQuart(_t));
	image_xscale = size_scale;
	image_yscale = size_scale;
	if(_t>=1) explode();
	
}