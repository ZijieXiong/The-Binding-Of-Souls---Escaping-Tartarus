var _dungeonWidth = floor(room_width / CELL_SIZE);
var _dungeonHeight = floor(room_height / CELL_SIZE);
dungeon = ds_grid_create(_dungeonWidth, _dungeonHeight);
global.mp_grid = mp_grid_create(0,0,_dungeonWidth,_dungeonHeight,CELL_SIZE,CELL_SIZE)

// Keeps track of all room structs
roomList = ds_list_create();

// Room size ranges
roomWidthMin = 8;
roomWidthMax = 10;
roomHeightMin = 8;
roomHeightMax = 10;

// Hallway size ranges
hallwayLengthMin = 4;
hallwayLengthMax = 5;
hallwayWidthMin = 2;
hallwayWidthMax = 2;

// Room to create a new room from
currentRoom = noone;

// 1 in n chance of branching from the newly created room
branchOdds = 3;

// The number of failed iterations to create a new room
iterations = 0;

// The maximum number of failed iterations before quitting generation
iterationMax = 50;

wallTileIndex = 16;

richochetProb = 0.2;

highestLevel = 0;
currLevel = 0;

chestProb = 100;

GenerateNewDungeon = function() {
	
	// Reset dungeon data
	iterations = 0;
	mp_grid_clear_all(global.mp_grid)
	ds_list_clear(roomList);
	global.global_room = []
	tilemap_clear(layer_tilemap_get_id(layer_get_id("Tiles_pyramid")), 0);
	tilemap_clear(layer_tilemap_get_id(layer_get_id("Tiles_ground")), 0);
	tilemap_clear(layer_tilemap_get_id(layer_get_id("Tiles_tech")), 0);
	tilemap_clear(layer_tilemap_get_id(layer_get_id("WallTile")), 0);
	tilemap_clear(layer_tilemap_get_id(layer_get_id("Dungeon")), 0);
	with(obj_wall){
		instance_destroy();
	}
	with(oEnemiesParent){
		instance_destroy();
	}
	with(obj_pistol_bullet){
		instance_destroy();
	}
	with(oEnemBullet){
		instance_destroy();
	}
	with(obj_hazard){
		instance_destroy();
	}
	with(oHeartBooster){
		instance_destroy();
	}
	with(oRichochet){
		instance_destroy();
	}
	with(oBomb){
		instance_destroy();
	}
	with(obj_chest){
		instance_destroy();
	}
	with(obj_upgrade_UI){
		instance_destroy();
	}
	with(obj_items_parent){
		instance_destroy();
	}
	with(obj_room)
	{
		instance_destroy();
	}
	with(obj_enemy_portal)
	{
		instance_destroy();
	}
	//if (global.currLevel <= 3) 
	//{
	//	with(obj_music)
	//	{
	//		instance_destroy();
	//	}
	//}
	for(var i = 0; i < ds_list_size(global.upgrade_objs); i++)
	{
		var upgrade_obj = ds_list_find_value(global.upgrade_objs, i);
		instance_destroy(upgrade_obj);
	}
	ds_list_clear(global.upgrade_objs);
	
	
	var _dungeonWidth = ds_grid_width(dungeon);
	var _dungeonHeight = ds_grid_height(dungeon);
	
	// Fill the whole dungeon with walls to start
	ds_grid_set_region(dungeon, 0, 0, _dungeonWidth - 1, _dungeonHeight - 1, CELL_TYPES.WALL);
	
	while (iterations < iterationMax) {
		
		// Generate a random room width and height
		var _roomWidth = irandom_range(roomWidthMin, roomWidthMax);
		var _roomHeight = irandom_range(roomHeightMin, roomHeightMax);
		
		if (!ds_list_empty(roomList)) {
			
			var _createdHallway = false;
			
			// Make a direction of possible directions to traverse from the current room
			var _dirList = ds_list_create();
			ds_list_add(_dirList, DIRECTIONS.WEST, DIRECTIONS.EAST, DIRECTIONS.NORTH, DIRECTIONS.SOUTH);
	
			while (!ds_list_empty(_dirList)) {
				
				// Remove a random cardinal direction
				
				var _dirIndex = irandom(ds_list_size(_dirList) - 1);
			
				var _dir = _dirList[| _dirIndex];
				ds_list_delete(_dirList, _dirIndex);
				
				// Generate a random hallway length and width
				var _hallwayLength = irandom_range(hallwayLengthMin, hallwayLengthMax);
				var _hallwayWidth = irandom_range(hallwayWidthMin, hallwayWidthMax);
		
				var _roomX1, _roomY1, _roomX2, _roomY2;
			
				// Calculate the top left corner of the new room based on distance and direction
				switch (_dir) {
					case DIRECTIONS.WEST:
						_roomX1 = currentRoom.x1 - _hallwayLength - _roomWidth;
						_roomY1 = irandom_range(currentRoom.y1 - _roomHeight + _hallwayWidth, currentRoom.y2 - (_hallwayWidth - 1));
						break;
					case DIRECTIONS.EAST:
						_roomX1 = currentRoom.x2 + _hallwayLength + 1;
						_roomY1 = irandom_range(currentRoom.y1 - _roomHeight + _hallwayWidth, currentRoom.y2 - (_hallwayWidth - 1));
						break;
					case DIRECTIONS.NORTH:
						_roomX1 = irandom_range(currentRoom.x1 - _roomWidth + _hallwayWidth, currentRoom.x2 - (_hallwayWidth - 1));
						_roomY1 = currentRoom.y1 - _hallwayLength - _roomHeight;
						break;
					case DIRECTIONS.SOUTH:
						_roomX1 = irandom_range(currentRoom.x1 - _roomWidth + _hallwayWidth, currentRoom.x2 - (_hallwayWidth - 1));
						_roomY1 = currentRoom.y2 + _hallwayLength + 1;
						break;
				}
			
				//Calculate the bottom right corner of the new room.
				_roomX2 = _roomX1 + _roomWidth - 1;
				_roomY2 = _roomY1 + _roomHeight - 1;
				
				// Skip this direction if new room is out of bounds
				if (_roomX1 <= 0 || _roomX1 >= _dungeonWidth - 2 - _roomWidth || _roomY1 <= 0 || _roomY1 >= _dungeonHeight - 2 - _roomHeight) {
					continue;
				}
			
				var _hallwayX1, _hallwayX2, _hallwayY1, _hallwayY2;
				var _minRange, _maxRange;
				var isNorthSouth;
				//Connect the new room and previous room with a hallway, and calculate the hallway's four corners
				switch (_dir) {
					case DIRECTIONS.WEST:
						isNorthSouth = false;
						_hallwayX1 = _roomX2 + 1;
						_hallwayX2 = _hallwayX1 + _hallwayLength - 1;
						if (_roomY1 < currentRoom.y1) {
							_minRange = currentRoom.y1 + 1;
						}
						else {
							_minRange = _roomY1 + 1;
						}
                 
						if (_roomY2 > currentRoom.y2) {
							_maxRange = currentRoom.y2 - (_hallwayWidth - 1);
						}
						else {
							_maxRange = _roomY2 - (_hallwayWidth - 1);
						}
                 
						_hallwayY1 = _minRange + round(abs(_maxRange - _minRange) / 2);
						_hallwayY2 = _hallwayY1 + (_hallwayWidth - 1);
						break;
					case DIRECTIONS.EAST:
						isNorthSouth = false;
						_hallwayX1 = _roomX1 - _hallwayLength;
						_hallwayX2 = _hallwayX1 + _hallwayLength - 1;
						if (_roomY1 < currentRoom.y1) {
							_minRange = currentRoom.y1 + 1;
						}
						else {
							_minRange = _roomY1 + 1;
						}
                 
						if (_roomY2 > currentRoom.y2) {
							_maxRange = currentRoom.y2 - (_hallwayWidth - 1);
						}
						else {
							_maxRange = _roomY2 - (_hallwayWidth - 1);
						}
                 
						_hallwayY1 = _minRange + round(abs(_maxRange - _minRange) / 2);
						_hallwayY2 = _hallwayY1 + (_hallwayWidth - 1);
						break;
					case DIRECTIONS.NORTH:
						isNorthSouth = true;

						if (_roomX1 < currentRoom.x1) {
							_minRange = currentRoom.x1;
						}
						else {
							_minRange = _roomX1;
						}
                 
						if (_roomX2 > currentRoom.x2) {
							_maxRange = currentRoom.x2 - (_hallwayWidth - 1);
						}
						else {
							_maxRange = _roomX2 - (_hallwayWidth - 1);
						}
                 
						_hallwayX1 = _minRange + round(abs(_maxRange - _minRange) / 2);
						_hallwayX2 = _hallwayX1 + (_hallwayWidth - 1);
						_hallwayY1 = _roomY2 + 1;
						_hallwayY2 = _hallwayY1 + _hallwayLength - 1;
						break;
					case DIRECTIONS.SOUTH:
						isNorthSouth = true;
						if (_roomX1 < currentRoom.x1) {
							_minRange = currentRoom.x1;
						}
						else {
							_minRange = _roomX1;
						}
                 
						if (_roomX2 > currentRoom.x2) {
							_maxRange = currentRoom.x2 - (_hallwayWidth - 1);
						}
						else {
							_maxRange = _roomX2 - (_hallwayWidth - 1);
						}
                 
						_hallwayX1 = _minRange + round(abs(_maxRange - _minRange) / 2);
						_hallwayX2 = _hallwayX1 + (_hallwayWidth - 1);
						_hallwayY1 = _roomY1 - _hallwayLength;
						_hallwayY2 = _hallwayY1 + _hallwayLength - 1;
						break;
				}
			
				var _isTouching = false;
			
				// Check if the hallway is touching a non-wall space
				
				for (var xx = _roomX1 - 1; xx <= _roomX2 + 1; xx++) {
					
					for (var yy = _roomY1 - 1; yy <= _roomY2 + 1; yy++) {
					    if (dungeon[# xx, yy] != CELL_TYPES.WALL) {
					        _isTouching = true;
							break;
					    }
					}
					
					if (_isTouching) {
						break;
					}
				}
				
				if (!_isTouching) {
					
					//Check if the hallway is touching another room
				
					for (xx = _hallwayX1 - 1; xx <= _hallwayX2 + 1; xx++) {
					
						for (yy = _hallwayY1 - 1; yy <= _hallwayY2 + 1; yy++) {
						    if (xx < currentRoom.x1 || xx > currentRoom.x2 || yy < currentRoom.y1 || yy > currentRoom.y2) {
						        if (dungeon[# xx, yy] == CELL_TYPES.ROOM) {
						            _isTouching = true;
									break;
						        }
						    }
						}
					
						if (_isTouching) {
							break;
						}
					}
					
					if (!_isTouching) {
						//create hallway object first
						var hallway = new DungeonHallway(_hallwayX1, _hallwayY1, _hallwayX2, _hallwayY2, isNorthSouth);
						//add hallway to previous room
						ds_list_add(currentRoom.hallways, hallway);
						//create and paint new room
						var newRoom = CreateRoom(_roomX1, _roomY1, _roomX2, _roomY2);
						//paint hallways
						CreateHallway(_hallwayX1, _hallwayY1, _hallwayX2, _hallwayY2, isNorthSouth);
						//add hallway to new room
						ds_list_add(newRoom.hallways, hallway);
						_createdHallway = true;
						iterations = -1;
						break;
					}
				}
			}
			
			iterations++;
		
			ds_list_destroy(_dirList);
			
		    if (random(branchOdds) < 1) {
		        currentRoom = roomList[| irandom(ds_list_size(roomList) - 1)];
			}
		}
		else {
			
			// Position the room in a random location within bounds of the dungeon
			var _roomX1 = irandom(_dungeonWidth - _roomWidth) + 1;
			var _roomY1 = irandom(_dungeonHeight - _roomHeight) + 1;
			var _roomX2 = _roomX1 + _roomWidth - 1;
			var _roomY2 = _roomY1 + _roomHeight - 1;
	
			CreateRoom(_roomX1, _roomY1, _roomX2, _roomY2);
		}
	}

	for (var xx = 0; xx < _dungeonWidth; xx++) {
		for (var yy = 0; yy < _dungeonHeight; yy++) {
		
			var _cell = dungeon[# xx, yy];
			
			if _cell == CELL_TYPES.WALL{
				mp_grid_add_cell(global.mp_grid,xx,yy)
			}
			
			var _tileInd = 0;
		
			if (_cell == CELL_TYPES.ROOM) {
				_tileInd = 1;
			}
			else if (_cell == CELL_TYPES.HALLWAY) {
				_tileInd = 1;
			}
			if(global.currLevel < global.pyramid_layer){
			tilemap_set(layer_tilemap_get_id(layer_get_id("Tiles_ground")), _tileInd, xx, yy);
			}
			else if(global.currLevel < global.tech_layer){
			tilemap_set(layer_tilemap_get_id(layer_get_id("Tiles_pyramid")), _tileInd, xx, yy);
			}else{
				tilemap_set(layer_tilemap_get_id(layer_get_id("Tiles_tech")), _tileInd, xx, yy);
			}

		}
	}



	//test for new dungeonRoom structure
	/*var roomCount = ds_list_size(roomList);
	
	for(var i = 0; i < roomCount; i++)
	{
		var testRoom = ds_list_find_value(roomList,i);
		show_debug_message(string(testRoom.x1) + ", " + string(testRoom.y1) + " to " + string(testRoom.x2) + ", " + string(testRoom.y2));
		var hallwayCount = ds_list_size(testRoom.hallways);
		show_debug_message(string(hallwayCount));
	}*/
	
	//Init player
	var firstRoom = ds_list_find_value(roomList, 0);
	//show_debug_message(firstRoom)
	var centerX = (firstRoom.x1 + firstRoom.x2) / 2;
	var centerY = (firstRoom.y1 + firstRoom.y2) / 2;
	var playerInstance;
	var playerLives;
	if(instance_exists(_obj_player)){
		playerInstance = instance_find(_obj_player, 0);
		playerInstance.x = centerX * CELL_SIZE;
		playerInstance.y = centerY * CELL_SIZE;
	}
	else{
		playerInstance = instance_create_layer(centerX * CELL_SIZE + (CELL_SIZE / 2), centerY * CELL_SIZE + (CELL_SIZE / 2), "Dungeon", _obj_player);
	}
	var global_player;
	if(instance_exists(obj_player_main)){
		global_player = instance_find(obj_player_main,0)
	}else{
		global_player = instance_create_layer(centerX * CELL_SIZE + (CELL_SIZE / 2), centerY * CELL_SIZE + (CELL_SIZE / 2), "Dungeon", obj_player_main);
	}
	
	//set healthBoost prob
	if(playerInstance){
		playerLives = playerInstance.playerLives;
	}
	var healthBoostProb;
	if(global.currLevel>=10){
		healthBoostProb = 0.1;
	}
	else if(playerLives <=1){
		healthBoostProb = 0.2;
	}
	else if(playerLives >= 3){
		healthBoostProb = 0.1;
	}
	else if(playerLives >=5){
		healthBoostProb = 0.01;
	}
	else{
		healthBoostProb = 0.15;
	}
	var isBoostGenerated = false;
	
	//Select exit room
	var deadEnd = ds_list_create();
	for(var i = 1;i < ds_list_size(roomList);i++){
		var rm = ds_list_find_value(roomList,i);
		show_debug_message("Room " + string(i) + ": (" + string(rm.x1) + ", " + string(rm.y1) + ") to (" + string(rm.x2) + ", " + string(rm.y2) + ")");
	    show_debug_message("Width: " + string(rm.width) + ", Height: " + string(rm.height));

	    // 检查并打印关联的走廊信息
	    for (var j = 0; j < ds_list_size(rm.hallways); j++) {
	        var hallway = ds_list_find_value(rm.hallways, j);
	        show_debug_message("  Hallway " + string(j) + ": (" + string(hallway.x1) + ", " + string(hallway.y1) + ") to (" + string(hallway.x2) + ", " + string(hallway.y2) + ")");
	        show_debug_message("  Width: " + string(hallway.width) + ", Height: " + string(hallway.height) + ", Orientation: " + (hallway.NorthSouth ? "North-South" : "East-West"));
		}
		if(ds_list_size(rm.hallways)<=1){
			ds_list_add(deadEnd,{roomId: rm, roomInd: i});
			show_debug_message("is deadEnd");
		}
	}
	var reloadRand = irandom(ds_list_size(deadEnd) - 1);
	var reloadRoom = ds_list_find_value(deadEnd, reloadRand);
	var reloadRoomInd = reloadRoom.roomInd;
	
	if(global.currLevel <= 2)
	{
		chestProb = 100;
	}
	else
	{
		chestProb = max(30,  100 - 5 * global.currLevel);
	}
	
	var chestRoomInd = noone;
	var haveChestRoom = random_range(0,100)<=chestProb && ds_list_size(deadEnd) >= 2;
	
	if(haveChestRoom)
	{
		chestRoomInd = reloadRoomInd;
		while(chestRoomInd==reloadRoomInd)
		{
			var chestRand = irandom(ds_list_size(deadEnd) - 1);
			var chestRoom = ds_list_find_value(deadEnd, chestRand);
			chestRoomInd = chestRoom.roomInd;
		}
		
	}
	show_debug_message("dead end ammount" + string(ds_list_size(deadEnd)));
	for (var i = 0; i < ds_list_size(deadEnd); i++) {
	    var roomInfo = ds_list_find_value(deadEnd, i);
	    var roomId = roomInfo.roomId;
	    var roomInd = roomInfo.roomInd;

	    if (roomInd != reloadRoomInd && roomInd != chestRoomInd) {
	        if (random(1) <= 1) {
				show_debug_message("elite room");
				var elite_type = noone;
	            //var elite_type = oEliteTeleportRobotX;
				var eliteEnemy = instance_create_layer((roomId.x1 + roomId.x2 + 1) / 2 * CELL_SIZE, (roomId.y1 + roomId.y2 + 1) / 2 * CELL_SIZE, "Dungeon", obj_enemy_portal);
				CreateDoors(roomId, true);
	            roomId.room_obj.is_elite = true;
				roomId.room_obj.enemy_cleared = false;
				roomId.room_obj.enemies[0] = eliteEnemy;
				eliteEnemy.enemy_type = elite_type;
				eliteEnemy._current_room = roomId.room_obj
	        }
	    }
	}
	
	//Generating rooms
	/*
	var richochetRoom = noone;
	show_debug_message(string(global.richochet));
	if(!global.richochet && random_range(0,1)<richochetProb){
		richochetRoom = irandom_range(1, ds_list_size(roomList)-1);
	}*/
	for(var i = 0; i < ds_list_size(roomList);i++){
		var rm = ds_list_find_value(roomList,i);
		var enemy = [];
		var hazards = [];
		if(i!=0 && i!=reloadRoomInd && i!=chestRoomInd && !rm.room_obj.is_elite){
			hazards = CreateHazards(rm);
			rm.room_obj.hazards = hazards;
			enemy = CreateEnemies(rm.x1,rm.y1,rm.x2,rm.y2, hazards,rm.room_obj);
//			for(var i=0;i<array_length(enemy);i++){
//				enemy[i]._current_room = rm.room_obj
//			}
			rm.room_obj.enemies = enemy;
			
			/*if(richochetRoom==i){
				CreateRichochet(rm, hazards);
			}*/
			/*if(random_range(0,1) < healthBoostProb && !isBoostGenerated){
				CreateHealthBooster(rm, hazards);
			}*/
			CreateDoors(rm, true);
			rm.room_obj.enemy_cleared = false;
		}
		else
		{
			CreateDoors(rm, false);
		}
	}
	
	
	//Generate dungeon reload instance in this room;
	centerX = (reloadRoom.roomId.x1 + reloadRoom.roomId.x2) / 2;
	centerY = (reloadRoom.roomId.y1 + reloadRoom.roomId.y2) / 2;
	
	var exitInstance = instance_create_layer(centerX * CELL_SIZE, centerY * CELL_SIZE, "Dungeon", oDunReload);
	if(haveChestRoom)
	{
		centerX = (chestRoom.roomId.x1 + chestRoom.roomId.x2) / 2;
		centerY = (chestRoom.roomId.y1 + chestRoom.roomId.y2) / 2;
		var chestInstance = instance_create_layer(centerX * CELL_SIZE, centerY * CELL_SIZE, "Dungeon", obj_chest);
	}
	
	//PlayMusic();

load_mini_map(_dungeonWidth,_dungeonHeight);
instance_create_layer(0,0,"UI_Layer",obj_minimap_draw)
/* // comment out for now not tested 
if(instance_exists(oDunReload)) and (instance_exists(obj_player)){
		var _tamppath = path_add()
		var _findDoor = mp_grid_path(global.mp_grid,_tamppath,obj_player.x,obj_player.y,oDunReload.x,oDunReload.y,0);
		if !_findDoor {
			show_debug_message("cannot reach door")
			GenerateNewDungeon();
		}
		path_delete(_tamppath)
}
*/
}

CreateRoom = function(_x1, _y1, _x2, _y2) {
	
	currentRoom = new DungeonRoom(_x1, _y1, _x2, _y2);
	ds_list_add(roomList, currentRoom);
	array_push(global.global_room,[currentRoom,MAP_STATES.BLOCKED])
	//show_debug_message("end create" + string(550))
	// Fill the dungeon with a room
	ds_grid_set_region(dungeon, _x1, _y1, _x2, _y2, CELL_TYPES.ROOM);
	
	/*for (var xx = _x1 - 1; xx <= _x2 + 1; xx++) {
        tilemap_set(layer_tilemap_get_id(layer_get_id("WallTile")), wallTileIndex, xx, _y1 - 1);
        tilemap_set(layer_tilemap_get_id(layer_get_id("WallTile")), wallTileIndex, xx, _y2 + 1);
    }
    for (var yy = _y1 - 1; yy <= _y2 + 1; yy++) {
        tilemap_set(layer_tilemap_get_id(layer_get_id("WallTile")), wallTileIndex, _x1 - 1, yy);
        tilemap_set(layer_tilemap_get_id(layer_get_id("WallTile")), wallTileIndex, _x2 + 1, yy);
    }*/
	/*
    for (var xx = _x1 - 1; xx <= _x2 + 1; xx++) {
        instance_create_layer(xx * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_wall);
        instance_create_layer(xx * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_wall);
    }
    for (var yy = _y1 - 1; yy <= _y2 + 1; yy++) {
        instance_create_layer((_x1 - 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_wall);
        instance_create_layer((_x2 + 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_wall);
    }
	*/


	if(global.currLevel < global.pyramid_layer){
	instance_create_layer((_x1 - 1) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_ground_wall_upleft);
    instance_create_layer((_x2 + 1) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_ground_wall_upright);
    instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_ground_wall_botleft);
    instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_ground_wall_botright);
	for (var yy = _y1 - 1; yy <= _y2 + 1; yy++) {
    // Left and right walls
    if (yy == _y1 - 1 || yy == _y2 + 1) {
        // Corners are handled separately below, so skip them here
        continue;
    }
    instance_create_layer((_x1 - 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_ground_wall_left);
    instance_create_layer((_x2 + 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_ground_wall_right);
	}

	for (var xx = _x1 - 1; xx <= _x2 + 1; xx++) {
    // Top and bottom walls
    if (xx == _x1 - 1 || xx == _x2 + 1) {
        // Corners are handled separately below, so skip them here
        continue;
    }
    instance_create_layer(xx * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_ground_wall_up);
	var wallCoverYOffset = sprite_get_height(walltile_up); 
    instance_create_layer(xx * CELL_SIZE, (_y1 - 1) * CELL_SIZE+wallCoverYOffset, "WallTile", obj_ground_wallcover);
    instance_create_layer(xx * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_ground_wall_down);
	}
	
	}
	//pyramid
else if(global.currLevel < global.tech_layer) {
    instance_create_layer((_x1 - 1) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_wall_upleft);
    instance_create_layer((_x2 + 1) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_wall_upright);
    instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_wall_bottomleft);
    instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_wall_bottomright);
	for (var yy = _y1 - 1; yy <= _y2 + 1; yy++) {
    // Left and right walls
    if (yy == _y1 - 1 || yy == _y2 + 1) {
        // Corners are handled separately below, so skip them here
        continue;
    }
    instance_create_layer((_x1 - 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_wall_left);
    instance_create_layer((_x2 + 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_wall_right);
	}

	for (var xx = _x1 - 1; xx <= _x2 + 1; xx++) {
    // Top and bottom walls
    if (xx == _x1 - 1 || xx == _x2 + 1) {
        // Corners are handled separately below, so skip them here
        continue;
    }
    instance_create_layer(xx * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_wall_up);
	var wallCoverYOffset = sprite_get_height(walltile_up); 
    instance_create_layer(xx * CELL_SIZE, (_y1 - 1) * CELL_SIZE+wallCoverYOffset, "WallTile", obj_wall_wallcover);
    instance_create_layer(xx * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_wall_down);
	}
	}
//tech

	else  {
    instance_create_layer((_x1 - 1) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_tech_wall_upleft);
    instance_create_layer((_x2 + 1) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_tech_wall_upright);
    instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_tech_wall_botleft);
    instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_tech_wall_botright);
	for (var yy = _y1 - 1; yy <= _y2 + 1; yy++) {
    // Left and right walls
    if (yy == _y1 - 1 || yy == _y2 + 1) {
        // Corners are handled separately below, so skip them here
        continue;
    }
    instance_create_layer((_x1 - 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_tech_wall_left);
    instance_create_layer((_x2 + 1) * CELL_SIZE, yy * CELL_SIZE, "WallTile", obj_tech_wall_right);
	}

	for (var xx = _x1 - 1; xx <= _x2 + 1; xx++) {
    // Top and bottom walls
    if (xx == _x1 - 1 || xx == _x2 + 1) {
        // Corners are handled separately below, so skip them here
        continue;
    }
    instance_create_layer(xx * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "WallTile", obj_tech_wall_up);
	var wallCoverYOffset = sprite_get_height(walltile_up); 
    instance_create_layer(xx * CELL_SIZE, (_y1 - 1) * CELL_SIZE+wallCoverYOffset, "WallTile", obj_tech_wallcover);
    instance_create_layer(xx * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "WallTile", obj_tech_wall_down);
	}
	}


    

    // Corner walls
    
	return currentRoom;
	//CreateHazards(_x1,_y1,_x2,_y2);
}



CreateHallway = function(_x1, _y1, _x2, _y2, isNorthSouth) {
	// Fill the dungeon with a hallway

	
	ds_grid_set_region(dungeon, _x1, _y1, _x2, _y2, CELL_TYPES.HALLWAY);
if(global.currLevel<global.pyramid_layer){
	    if (isNorthSouth) {
        for (var temp_y = _y1; temp_y <= _y2; temp_y++) {
			 if (temp_y == _y1) {
             instance_create_layer((_x1 - 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_ground_wall_upright);
			 instance_create_layer((_x2 + 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_ground_wall_upleft);
              }
             // At the very bottom, place obj_wall_upleft
             else if (temp_y == _y2+1) {
             instance_create_layer((_x1 - 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_ground_wall_botright);
			 instance_create_layer((_x2 + 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_ground_wall_botleft);
             }
			 else{instance_create_layer((_x1 - 1) * CELL_SIZE, temp_y * CELL_SIZE, "Dungeon", obj_ground_wall_left);
            instance_create_layer((_x2+1 ) * CELL_SIZE, temp_y * CELL_SIZE, "Dungeon", obj_ground_wall_right);}
            
        }
		
		for (var temp_x = _x1; temp_x < _x2+1; temp_x++) {
			// Check and remove wall covers or walls at the entrance to the hallway
            var coverInstanceUp = instance_position(temp_x * CELL_SIZE, (_y1 -1) * CELL_SIZE, obj_wall);
            if (coverInstanceUp != noone) instance_destroy(coverInstanceUp);
			
			var coverInstanceDown = instance_position(temp_x * CELL_SIZE, (_y2 + 1) * CELL_SIZE, obj_wall);
            if (coverInstanceDown != noone) instance_destroy(coverInstanceDown);
			
            var instanceLeft = instance_position((temp_x) * CELL_SIZE, _y1 * CELL_SIZE, obj_wall);
	        if (instanceLeft != noone) instance_destroy(instanceLeft);

	        var instanceRight = instance_position((temp_x) * CELL_SIZE, _y2 * CELL_SIZE, obj_wall);
	        if (instanceRight != noone) instance_destroy(instanceRight);
	        }
    } else {
		//show_debug_message(_x1, _x2, _y1, _y2);
        for (var temp_x = _x1; temp_x <= _x2; temp_x++) {
			 if (temp_x == _x1) {
             instance_create_layer((temp_x) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_ground_wall_botleft);
			 instance_create_layer((temp_x) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_ground_wall_upleft);
              }
             // At the very bottom, place obj_wall_upleft
             else if (temp_x == _x2+1) {
             instance_create_layer((temp_x) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_ground_wall_botright);
			 instance_create_layer((temp_x) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_ground_wall_upright);
             }
			 else{
			 instance_create_layer(temp_x * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_ground_wall_up);
             instance_create_layer(temp_x * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_ground_wall_down);
			 }
            
        }
		for (var temp_y = _y1; temp_y < _y2+1; temp_y++) {
			/*
			var coverInstanceUp = instance_position((_x1 - 1) * CELL_SIZE, temp_y * CELL_SIZE,  obj_wall);
            if (coverInstanceUp != noone) instance_destroy(coverInstanceUp);
			
			var coverInstanceDown = instance_position((_x2 + 1) * CELL_SIZE, temp_y * CELL_SIZE,  obj_wall);
            if (coverInstanceDown != noone) instance_destroy(coverInstanceDown);
			*/
	        var instanceLeft = instance_position((_x1) * CELL_SIZE, temp_y * CELL_SIZE, obj_wall);
	        if (instanceLeft != noone) instance_destroy(instanceLeft);

	        var instanceRight = instance_position((_x2) * CELL_SIZE, temp_y * CELL_SIZE, obj_wall);
	        if (instanceRight != noone) instance_destroy(instanceRight);
	    }
		var coverInstanceLeftUp = instance_position((_x1 - 1) * CELL_SIZE, _y1 * CELL_SIZE,  obj_wall);
		var coverInstanceLeftDown = instance_position((_x1 - 1) * CELL_SIZE, _y2 * CELL_SIZE,  obj_wall);
		show_debug_message(coverInstanceLeftDown)
		show_debug_message(coverInstanceLeftUp);
		if(coverInstanceLeftDown && !coverInstanceLeftUp)
		{
			show_debug_message("Left down touch wall")
			instance_destroy(coverInstanceLeftDown);
			instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2) * CELL_SIZE, "Dungeon", obj_ground_wall_upright);
			instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2+1) * CELL_SIZE, "Dungeon", obj_ground_wall_botleft);
		}
		if(coverInstanceLeftUp && !coverInstanceLeftDown)
		{
			show_debug_message("Left up touch wall");
		}
		var coverInstanceRightUp = instance_position((_x2 + 1) * CELL_SIZE, _y1 * CELL_SIZE,  obj_wall);
		var coverInstanceRightDown = instance_position((_x2 + 1) * CELL_SIZE, _y2 * CELL_SIZE,  obj_wall);
		show_debug_message(coverInstanceRightDown)
		show_debug_message(coverInstanceRightUp);
		if(coverInstanceRightDown && !coverInstanceRightUp)
		{
			show_debug_message("Right down touch wall")
			instance_destroy(coverInstanceRightDown);
			instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2) * CELL_SIZE, "Dungeon", obj_ground_wall_upleft);
			instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2+1) * CELL_SIZE, "Dungeon", obj_ground_wall_botright);
		}
		if(coverInstanceRightUp && !coverInstanceRightDown)
		{
			show_debug_message("Right up touch wall");
		}
    }
}
//pyramid
else if (global.currLevel < global.tech_layer){
    if (isNorthSouth) {
        for (var temp_y = _y1; temp_y <= _y2; temp_y++) {
			 if (temp_y == _y1) {
             instance_create_layer((_x1 - 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_hallway_botleft);
			 instance_create_layer((_x2 + 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_hallway_botright);
              }
             // At the very bottom, place obj_wall_upleft
             else if (temp_y == _y2+1) {
             instance_create_layer((_x1 - 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_hallway_upleft);
			 instance_create_layer((_x2 + 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_hallway_upright);
             }
			 else{instance_create_layer((_x1 - 1) * CELL_SIZE, temp_y * CELL_SIZE, "Dungeon", obj_wall_left);
            instance_create_layer((_x2 + 1) * CELL_SIZE, temp_y * CELL_SIZE, "Dungeon", obj_wall_right);}
            
        }
		
		for (var temp_x = _x1; temp_x < _x2+1; temp_x++) {
			// Check and remove wall covers or walls at the entrance to the hallway
            var coverInstanceUp = instance_position(temp_x * CELL_SIZE, (_y1 -1) * CELL_SIZE,  obj_wall);
            if (coverInstanceUp != noone) instance_destroy(coverInstanceUp);
			
			var coverInstanceDown = instance_position(temp_x * CELL_SIZE, (_y2 + 1) * CELL_SIZE, obj_wall);
            if (coverInstanceDown != noone) instance_destroy(coverInstanceDown);
			
            var instanceLeft = instance_position((temp_x) * CELL_SIZE, _y1 * CELL_SIZE, obj_wall);
	        if (instanceLeft != noone) instance_destroy(instanceLeft);

	        var instanceRight = instance_position((temp_x) * CELL_SIZE, _y2 * CELL_SIZE, obj_wall);
	        if (instanceRight != noone) instance_destroy(instanceRight);
	        }
    } else {
        for (var temp_x = _x1; temp_x <= _x2; temp_x++) {
			 if (temp_x == _x1) {
             instance_create_layer((temp_x) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_hallway_upright);
			 instance_create_layer((temp_x) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_hallway_botright);
              }
             // At the very bottom, place obj_wall_upleft
             else if (temp_x == _x2+1) {
             instance_create_layer((temp_x) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_hallway_upleft);
			 instance_create_layer((temp_x) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_hallway_botleft);
             }
			 else{
			 instance_create_layer(temp_x * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_wall_up);
             instance_create_layer(temp_x * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_wall_down);
			 }
            
        }
		for (var temp_y = _y1; temp_y < _y2+1; temp_y++) {
			/*var coverInstanceUp = instance_position((_x1-1) * CELL_SIZE, temp_y * CELL_SIZE,  obj_wall);
            if (coverInstanceUp != noone) instance_destroy(coverInstanceUp);
			
			var coverInstanceDown = instance_position((_x2+1) * CELL_SIZE, temp_y * CELL_SIZE,  obj_wall);
            if (coverInstanceDown != noone) instance_destroy(coverInstanceDown);*/
			
	        var instanceLeft = instance_position((_x1) * CELL_SIZE, temp_y * CELL_SIZE, obj_wall);
	        if (instanceLeft != noone) instance_destroy(instanceLeft);

	        var instanceRight = instance_position((_x2) * CELL_SIZE, temp_y * CELL_SIZE, obj_wall);
	        if (instanceRight != noone) instance_destroy(instanceRight);
	    }
		var coverInstanceLeftUp = instance_position((_x1 - 1) * CELL_SIZE, _y1 * CELL_SIZE,  obj_wall);
		var coverInstanceLeftDown = instance_position((_x1 - 1) * CELL_SIZE, _y2 * CELL_SIZE,  obj_wall);
		show_debug_message(coverInstanceLeftDown)
		show_debug_message(coverInstanceLeftUp);
		if(coverInstanceLeftDown && !coverInstanceLeftUp)
		{
			show_debug_message("Left down touch wall")
			instance_destroy(coverInstanceLeftDown);
			instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2) * CELL_SIZE, "Dungeon", obj_hallway_botleft);
			//instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2+1) * CELL_SIZE, "Dungeon", obj_wall_bottomleft);
		}
		if(coverInstanceLeftUp && !coverInstanceLeftDown)
		{
			show_debug_message("Left up touch wall");
		}
		var coverInstanceRightUp = instance_position((_x2 + 1) * CELL_SIZE, _y1 * CELL_SIZE,  obj_wall);
		var coverInstanceRightDown = instance_position((_x2 + 1) * CELL_SIZE, _y2 * CELL_SIZE,  obj_wall);
		show_debug_message(coverInstanceRightDown)
		show_debug_message(coverInstanceRightUp);
		if(coverInstanceRightDown && !coverInstanceRightUp)
		{
			show_debug_message("Right down touch wall")
			instance_destroy(coverInstanceRightDown);
			instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2) * CELL_SIZE, "Dungeon", obj_hallway_botright);
			//instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2+1) * CELL_SIZE, "Dungeon", obj_wall_bottomright);
		}
		if(coverInstanceRightUp && !coverInstanceRightDown)
		{
			show_debug_message("Right up touch wall");
		}
    }
}//tech
else{
    if (isNorthSouth) {
        for (var temp_y = _y1; temp_y <= _y2; temp_y++) {
			 if (temp_y == _y1) {
             instance_create_layer((_x1 - 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_tech_wall_upright);
			 instance_create_layer((_x2 + 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_tech_wall_upleft);
              }
             // At the very bottom, place obj_wall_upleft
             else if (temp_y == _y2+1) {
             instance_create_layer((_x1 - 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_tech_wall_botright);
			 instance_create_layer((_x2 + 1) * CELL_SIZE, (temp_y) * CELL_SIZE, "Dungeon", obj_tech_wall_botleft);
             }
			 else{instance_create_layer((_x1 - 1) * CELL_SIZE, temp_y * CELL_SIZE, "Dungeon", obj_tech_wall_left);
            instance_create_layer((_x2 + 1) * CELL_SIZE, temp_y * CELL_SIZE, "Dungeon", obj_tech_wall_right);}
            
        }
		
		for (var temp_x = _x1; temp_x < _x2+1; temp_x++) {
			// Check and remove wall covers or walls at the entrance to the hallway
            var coverInstanceUp = instance_position(temp_x * CELL_SIZE, (_y1 -1) * CELL_SIZE,  obj_wall);
            if (coverInstanceUp != noone) instance_destroy(coverInstanceUp);
			
			var coverInstanceDown = instance_position(temp_x * CELL_SIZE, (_y2 + 1) * CELL_SIZE,  obj_wall);
            if (coverInstanceDown != noone) instance_destroy(coverInstanceDown);
			
            var instanceLeft = instance_position((temp_x) * CELL_SIZE, _y1 * CELL_SIZE, obj_wall);
	        if (instanceLeft != noone) instance_destroy(instanceLeft);

	        var instanceRight = instance_position((temp_x) * CELL_SIZE, _y2 * CELL_SIZE, obj_wall);
	        if (instanceRight != noone) instance_destroy(instanceRight);
	        }
    } else {
        for (var temp_x = _x1; temp_x <= _x2; temp_x++) {
			 if (temp_x == _x1) {
             instance_create_layer((temp_x) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_tech_wall_botleft);
			 instance_create_layer((temp_x) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_tech_wall_upleft);
              }
             // At the very bottom, place obj_wall_upleft
             else if (temp_x == _x2+1) {
             instance_create_layer((temp_x) * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_tech_wall_botright);
			 instance_create_layer((temp_x) * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_tech_wall_upright);
             }
			 else{
			 instance_create_layer(temp_x * CELL_SIZE, (_y1 - 1) * CELL_SIZE, "Dungeon", obj_tech_wall_up);
             instance_create_layer(temp_x * CELL_SIZE, (_y2 + 1) * CELL_SIZE, "Dungeon", obj_tech_wall_down);
			 }
            
        }
		for (var temp_y = _y1; temp_y < _y2+1; temp_y++) {
			/*var coverInstanceUp = instance_position(temp_x * CELL_SIZE, (_y1-1) * CELL_SIZE, obj_wall);
            if (coverInstanceUp != noone) instance_destroy(coverInstanceUp);
			
			var coverInstanceDown = instance_position(temp_x * CELL_SIZE, (_y2 + 1) * CELL_SIZE, obj_wall);
            if (coverInstanceDown != noone) instance_destroy(coverInstanceDown);
			*/
	        var instanceLeft = instance_position((_x1) * CELL_SIZE, temp_y * CELL_SIZE, obj_wall);
	        if (instanceLeft != noone) instance_destroy(instanceLeft);

	        var instanceRight = instance_position((_x2) * CELL_SIZE, temp_y * CELL_SIZE, obj_wall);
	        if (instanceRight != noone) instance_destroy(instanceRight);
	    }
		var coverInstanceLeftUp = instance_position((_x1 - 1) * CELL_SIZE, _y1 * CELL_SIZE,  obj_wall);
		var coverInstanceLeftDown = instance_position((_x1 - 1) * CELL_SIZE, _y2 * CELL_SIZE,  obj_wall);
		show_debug_message(coverInstanceLeftDown)
		show_debug_message(coverInstanceLeftUp);
		if(coverInstanceLeftDown && !coverInstanceLeftUp)
		{
			show_debug_message("Left down touch wall")
			instance_destroy(coverInstanceLeftDown);
			instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2) * CELL_SIZE, "Dungeon", obj_tech_wall_upright);
			//instance_create_layer((_x1 - 1) * CELL_SIZE, (_y2+1) * CELL_SIZE, "Dungeon", obj_tech_wall_botleft);
		}
		if(coverInstanceLeftUp && !coverInstanceLeftDown)
		{
			show_debug_message("Left up touch wall");
		}
		var coverInstanceRightUp = instance_position((_x2 + 1) * CELL_SIZE, _y1 * CELL_SIZE,  obj_wall);
		var coverInstanceRightDown = instance_position((_x2 + 1) * CELL_SIZE, _y2 * CELL_SIZE,  obj_wall);
		show_debug_message(coverInstanceRightDown)
		show_debug_message(coverInstanceRightUp);
		if(coverInstanceRightDown && !coverInstanceRightUp)
		{
			show_debug_message("Right down touch wall")
			instance_destroy(coverInstanceRightDown);
			instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2) * CELL_SIZE, "Dungeon", obj_tech_wall_upleft);
			//instance_create_layer((_x2 + 1) * CELL_SIZE, (_y2+1) * CELL_SIZE, "Dungeon", obj_tech_wall_botright);
		}
		if(coverInstanceRightUp && !coverInstanceRightDown)
		{
			show_debug_message("Right up touch wall");
		}
    }
}
}

CreateHealthBooster = function(rm, hazards){
	var healthBooster = instance_create_layer((rm.x1 + rm.x2)/2 * CELL_SIZE, (rm.y1+rm.y2)/2 * CELL_SIZE, "Dungeon", oHeartBooster);
	var iter = 0;
	var dist = 64;
	var validPosition = false;
	var healthBoosterWidth = sprite_get_width(healthBooster.sprite_index);
	var healthBoosterHeight = sprite_get_height(healthBooster.sprite_index);
	var posX, posY;
	var adjusted_x1 = rm.x1 * CELL_SIZE;
	var adjusted_y1 = rm.y1 * CELL_SIZE;
	var adjusted_x2 = rm.x2 * CELL_SIZE - healthBoosterWidth;
	var adjusted_y2 = rm.y2 * CELL_SIZE - healthBoosterHeight;
	
	while(!validPosition && iter<50){
		validPosition = true;
		posX = irandom_range(adjusted_x1, adjusted_x2);
		posY = irandom_range(adjusted_y1, adjusted_y2);
		for (var i = 0; i < array_length(hazards); i++) {
			if (point_distance(posX, posY, hazards[i].x, hazards[i].y) < dist) {
					validPosition = false;
					break;
			}
		}
	}
	
	healthBooster.x = posX;
	healthBooster.y = posY;
}

CreateRichochet = function(rm, hazards){
	var richochet = instance_create_layer((rm.x1 + rm.x2)/2 * CELL_SIZE, (rm.y1+rm.y2)/2 * CELL_SIZE, "Dungeon", oRichochet);
	var iter = 0;
	var dist = 64;
	var validPosition = false;
	var richochetWidth = sprite_get_width(richochet.sprite_index);
	var richochetHeight = sprite_get_height(richochet.sprite_index);
	var posX, posY;
	var adjusted_x1 = rm.x1 * CELL_SIZE;
	var adjusted_y1 = rm.y1 * CELL_SIZE;
	var adjusted_x2 = rm.x2 * CELL_SIZE - richochetWidth;
	var adjusted_y2 = rm.y2 * CELL_SIZE - richochetHeight;
	
	while(!validPosition && iter<50){
		validPosition = true;
		posX = irandom_range(adjusted_x1, adjusted_x2);
		posY = irandom_range(adjusted_y1, adjusted_y2);
		for (var i = 0; i < array_length(hazards); i++) {
			if (point_distance(posX, posY, hazards[i].x, hazards[i].y) < dist) {
					validPosition = false;
					break;
			}
		}
	}
	
	richochet.x = posX;
	richochet.y = posY;
}

CreateHazards = function(rm) {
	var _x1 = rm.x1;
	var _y1 = rm.y1;
	var _x2 = rm.x2;
	var _y2 = rm.y2;
	var hazardCount = irandom_range(1,3);
	var placedHazards = [];
	var hazardDistance = 128;
	var hallwayDistance = 64;
	for(var j = 0; j<hazardCount;j++){
		var hazard;
		var posX, posY;
		var validPosition = false;
		var size = random_range(0.8,1.2);
		if(global.currLevel < global.pyramid_layer)
		{
		    hazard = instance_create_layer(0,0,"WallTile", obj_ground_obstacle);
		}
		else if(global.currLevel < global.tech_layer)
		{
			hazard = instance_create_layer(0,0,"WallTile", obj_pyramid_obstacle);
		}
		else{
		    hazard = instance_create_layer(0,0,"WallTile", obj_tech_obstacle);
		}
		var iter = 0;
		while(!validPosition && iter < 50){
			iter++;
			var hazard_width = sprite_get_width(hazard.sprite_index) * size;
			var hazard_height = sprite_get_height(hazard.sprite_index) * size;
			
			var adjusted_x1 = _x1 * CELL_SIZE + hallwayDistance;
	        var adjusted_y1 = _y1 * CELL_SIZE + hallwayDistance;
	        var adjusted_x2 = _x2 * CELL_SIZE - hazard_width - hallwayDistance;
	        var adjusted_y2 = _y2 * CELL_SIZE - hazard_height - hallwayDistance;
		
			var posX = irandom_range(adjusted_x1, adjusted_x2);
			var posY = irandom_range(adjusted_y1, adjusted_y2);
			
			validPosition = true;
			for (var i = 0; i < array_length(placedHazards); i++) {
				var placedHazard = placedHazards[i];
				if (point_distance(posX, posY, placedHazard.x, placedHazard.y) < hazardDistance) {
					validPosition = false;
					break;
				}
			}
			for (var i = 0;i < ds_list_size(rm.hallways);i++){
				var hallway = ds_list_find_value(rm.hallways, i);
				if(hallway.NorthSouth){
					if(posX >= hallway.x1 * CELL_SIZE - hazard_width && posX<= hallway.x2 * CELL_SIZE){
						if(rm.y2 == hallway.y2){
							if(hallway.y2 * CELL_SIZE - posY < hallwayDistance){
								validPosition = false;
							}
						}
						else{
							if(posY - hallway.y1 * CELL_SIZE < hallwayDistance){
								validPosition = false;
							}
						}
					}
				}
				else{
					if(posY >= hallway.y1 * CELL_SIZE - hazard_height && posY<= hallway.y2 * CELL_SIZE){
						if(rm.x2 == hallway.x2){
							if(hallway.x2 * CELL_SIZE - posX < hallwayDistance){
								validPosition = false;
							}
						}
						else{
							if(posX - hallway.x1 * CELL_SIZE < hallwayDistance){
								validPosition = false;
							}
						}
					}
				}
			}
		}
		if(validPosition)
		{
			hazard.x = posX;
			hazard.y = posY;
			hazard.image_xscale = size;
	        hazard.image_yscale = size;
			placedHazards[array_length(placedHazards)] = hazard;
			mp_grid_add_instances(global.mp_grid,hazard,true)
		}
		else{
			instance_destroy(hazard);
		}
	}
	return placedHazards;
}

CreateEnemies = function(_x1,_y1,_x2,_y2, hazards,_room_obj){
	var enemyCount = irandom_range(2 + global.currLevel div 3,3 + global.currLevel div 3);
	var placedEnemies = [];
	var enemyDistance = 60;
	var wallDistance = 70;
	for(var j = 0; j<enemyCount;j++){
		var enemyType;
		if(global.currLevel < global.pyramid_layer)
		{
			enemyType = choose(oMegaSlime, oPango, oTrackShooter);
			//enemyType = oEliteTeleportRobotX;
		}
		//var enemyType = oEliteMummy;
		else if (global.currLevel < global.tech_layer) {
			//enemyType = choose(oMummy, oSkullShooter);
			enemyType = choose(oAnubis, oMummy, oSkullShooter);
		}
		else{
			enemyType = choose(oGarbageBot, oTurret, oTeleportRobot);
			//enemyType = oEliteTeleportRobotX;
		}
		
		var enemy;
		var posX, posY;
		var validPosition = false;
		enemy = instance_create_layer((_x1+_x2)/2 * CELL_SIZE,(_y1+_y2)/2 * CELL_SIZE,"Dungeon", obj_enemy_portal);
		enemy.enemy_type = enemyType;
		//enemy.enemy_type = oEliteTeleportRobotX;
		var iter = 0;
		
		while(!validPosition && iter < 100){
			iter++;
			var adjusted_x1 = _x1 * CELL_SIZE + wallDistance;
	        var adjusted_y1 = _y1 * CELL_SIZE + wallDistance;
	        var adjusted_x2 = _x2 * CELL_SIZE - wallDistance;
	        var adjusted_y2 = _y2 * CELL_SIZE - wallDistance;
		
			var posX = random_range(adjusted_x1, adjusted_x2);
			var posY = random_range(adjusted_y1, adjusted_y2);
			
			validPosition = true;
			for (var i = 0; i < array_length(placedEnemies); i++) {
				var placedEnemy = placedEnemies[i];
				if (point_distance(posX, posY, placedEnemy.x, placedEnemy.y) < enemyDistance) {
					validPosition = false;
					break;
				}
			}
			for (var i = 0; i < array_length(hazards); i++) {
				var hazard = hazards[i];
				var offset = sprite_get_width(hazard.sprite_index) * hazard.image_xscale / 2;
				if (point_distance(posX, posY, hazards[i].x + offset , hazards[i].y + offset) < wallDistance) {
					validPosition = false;
					break;
				}
			}
			
		}
		if(validPosition){
			enemy.x = posX;
			enemy.y = posY;
			enemy._current_room = _room_obj
			placedEnemies[array_length(placedEnemies)] = enemy;
		}
		else
		{
			instance_destroy(enemy);
		}
	}
	return placedEnemies;
}

CreateDoors = function(eliteRoom, isEnemy){
	var doors = [];
    for (var i = 0; i < ds_list_size(eliteRoom.hallways); i++) {
        var hallway = ds_list_find_value(eliteRoom.hallways, i);

        var doorX, doorY, doorAngle;

        if (hallway.NorthSouth) {
            doorX = (hallway.x1 + hallway.x2) / 2 * CELL_SIZE + CELL_SIZE / 2;
            if (eliteRoom.y1 == hallway.y2 + 1) {
                doorY = hallway.y2 * CELL_SIZE + CELL_SIZE / 2;
                doorAngle = 0;
            } else {
                doorY = hallway.y1 * CELL_SIZE + CELL_SIZE / 2;
                doorAngle = 0;
            }
        } else {
            doorY = (hallway.y1 + hallway.y2) / 2 * CELL_SIZE + CELL_SIZE / 2;
            if (eliteRoom.x1 == hallway.x2 + 1) {
                doorX = hallway.x2 * CELL_SIZE + CELL_SIZE / 2;
                doorAngle = 270;
            } else {
                doorX = hallway.x1 * CELL_SIZE + CELL_SIZE / 2;
                doorAngle = 90;
            }
        }
		var doorInstance;
        if(global.currLevel < global.pyramid_layer){
			doorInstance = instance_create_layer(doorX, doorY, "Instances", obj_ground_door);
		}else if(global.currLevel < global.tech_layer){
			doorInstance = instance_create_layer(doorX, doorY, "Instances", obj_door);
		}else{
			doorInstance = instance_create_layer(doorX, doorY, "Instances", obj_tech_door);
		}
        
        doorInstance.image_angle = doorAngle;
		doorInstance.linked_room = eliteRoom;
		doorInstance.enemy_cleared = !isEnemy;
		doors[array_length(doors)] = doorInstance;
    }
	eliteRoom.room_obj.doors = doors;
}

function ChooseEliteEnemy(){
	var elite_type;
	if(global.currLevel < global.pyramid_layer)
	{
		//elite_type = oEliteSlime;
		elite_type = choose(oElitePango, oEliteSlime);
	}
	//var enemyType = oEliteMummy;
	else if (global.currLevel < global.tech_layer) {
		//elite_type = oEliteMummyWithLaser;
		elite_type = choose(oEliteMummy, oEliteMummyWithLaser);
	}
	else{
		elite_type = oEliteTeleportRobotX;
		//elite_type = choose(oEliteTeleportRobot, oEliteTurret, oEliteTeleportRobotX);
	}
	var iter = 0;
	while(elite_type == global.last_elite_type)
	{
		if(global.currLevel < global.pyramid_layer)
		{
			//elite_type = oEliteSlime;
			elite_type = choose(oElitePango, oEliteSlime);
		}
		//var enemyType = oEliteMummy;
		else if (global.currLevel < global.tech_layer) {
			//elite_type = oEliteMummyWithLaser;
			elite_type = choose(oEliteMummy, oEliteMummyWithLaser);
		}
		else{
			//elite_type = oEliteTeleportRobotX;
			elite_type = choose(oEliteTeleportRobot, oEliteTurret, oEliteTeleportRobotX);
		}
		iter++;
		if iter >=50{
			break;
		}
	}
	global.last_elite_type = elite_type;
	return elite_type;
}

CreateItemUI = function() {
	var itemSlot = instance_create_layer();
}

//PlayMusic = function() {
//	if (global.currLevel <= 3) {
//		instance_create_layer(x, y, "Music", obj_music);
//	}
//}

initParas();

GenerateNewDungeon();

