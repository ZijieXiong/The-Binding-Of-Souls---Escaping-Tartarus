var x_movement = x-xprevious;

if(x_movement < 0)
{
	image_xscale = size_scale;
	image_yscale = size_scale;
}

else
{
	image_xscale = -size_scale;
	image_yscale = size_scale;
}