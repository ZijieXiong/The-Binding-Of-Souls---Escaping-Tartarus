
if(!is_ground && point_distance(x, y, target_x, target_y)<5)
{
	with(other)
	{	
		TakeDamage();
	}
	
	instance_create_layer(x, y, "Instances", oPangoSpikeEnd);
	instance_destroy();
}