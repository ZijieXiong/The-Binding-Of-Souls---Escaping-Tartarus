var x_movement = x-xprevious;

if(x_movement < 0)
{
	image_xscale = -1 * slime_size;
	image_yscale = slime_size;
}

else
{
	image_xscale = 1 * slime_size;
	image_yscale = slime_size;
}