/// @description Insert description here
// You can write your code in this editor

if(is_ground)
{
	instance_create_layer(x, y, "Instances", oPangoSpikeEnd);
	instance_destroy();
	screenshake(10, 2, 0.2);
}