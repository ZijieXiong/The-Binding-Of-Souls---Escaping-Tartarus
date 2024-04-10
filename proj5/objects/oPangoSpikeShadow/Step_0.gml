/// @description Insert description here
// You can write your code in this editor

count++;



image_xscale = lerp(initial_scale, target_scale, count/life_time);
image_yscale = spike_size * lerp(initial_scale, target_scale, count/life_time);



if(count>=life_time)
{
	instance_destroy();
}

