_health = 0
_flash = 0
invincible = false
_currentRoom = noone
path = path_add()

item_prob = 50;

item_types = [oShieldPicker];

function dropItem()
{
	if(random(100) <= 50)
	{
		var item_ind = irandom(array_length(item_types) - 1);
		instance_create_layer(x,y,"Instances",item_types[item_ind]);
	}
}