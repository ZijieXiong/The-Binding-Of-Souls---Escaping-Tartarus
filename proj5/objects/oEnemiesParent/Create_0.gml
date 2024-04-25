_health = 50 + (global.currLevel -1) * 10;
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

get_random_point_in_room = function()
{
	var _x = random_range(_currentRoom.x1 * CELL_SIZE,(_currentRoom.x2+1) * CELL_SIZE);
	var _y = random_range((_currentRoom.y1+1) * CELL_SIZE,(_currentRoom.y2+1) * CELL_SIZE);
	return [_x, _y];
}

is_in_room = function(_x, _y)
{
	var _bX = (_currentRoom.x1 * CELL_SIZE<= _x) && (_x <=(_currentRoom.x2+1) * CELL_SIZE);
	var _bY = ((_currentRoom.y1+1) * CELL_SIZE<= _y) &&  (_y<=(_currentRoom.y2+1) * CELL_SIZE);
	return _bX && _bY;
}