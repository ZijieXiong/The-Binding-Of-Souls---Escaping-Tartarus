function DungeonRoom(_x1, _y1, _x2, _y2) constructor {
	
	// Top left corner coordinates
	x1 = _x1;
	y1 = _y1;
	// Bottom right corner coordinates
	x2 = _x2;
	y2 = _y2;
	
	// Calculate room's width and height
	width = x2 - x1 + 1;
	height = y2 - y1 + 1;
	
	hallways = ds_list_create();
	is_elite = false;
	room_obj = instance_create_layer((_x1 + _x2)/2*CELL_SIZE, (_y1 + _y2)/2*CELL_SIZE, "Dungeon", obj_room);
	room_obj.x1 = x1;
	room_obj.x2 = x2;
	room_obj.y1 = y1;
	room_obj.y2 = y2;
}

function DungeonHallway(_x1, _y1, _x2, _y2, isNorthSouth) constructor{
	// Top left corner coordinates
	x1 = _x1;
	y1 = _y1;
	// Bottom right corner coordinates
	x2 = _x2;
	y2 = _y2;
	NorthSouth = isNorthSouth;
	
	// Calculate room's width and height
	width = x2 - x1 + 1;
	height = y2 - y1 + 1;

}