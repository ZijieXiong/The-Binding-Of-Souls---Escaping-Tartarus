/// @description Insert description here
// You can write your code in this editor
var x_movement = x-xprevious;

if(x_movement < 0)
{
	image_xscale = -size_scale;
	image_yscale = size_scale;
}

if(x_movement > 0)
{
	image_xscale = size_scale;
	image_yscale = size_scale;
}