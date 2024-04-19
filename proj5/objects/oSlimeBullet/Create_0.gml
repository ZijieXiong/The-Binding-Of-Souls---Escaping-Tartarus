/// @description Insert description here
// You can write your code in this editor

stable_size_scale = 0.5;
final_size_scale = 1.2;


size_scale = stable_size_scale;
image_xscale = size_scale;
image_yscale = size_scale;


stable_time = 1;
swell_time = 1;

alarm[0]= stable_time * 60;

swell_count = 0;
swell_total_count = 0.5 * 60;


is_swelling = false;

easeOutQuart = function(_t)
{
	return 1-power(1-_t, 4);
}

explode = function ()
{
	//create explode effect
	var _explosion = instance_create_layer(x, y, "Instances", oSlimeBulletExplosion);
	instance_destroy();
}
