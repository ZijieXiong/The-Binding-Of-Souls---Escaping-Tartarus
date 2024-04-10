/// @description Insert description here
// You can write your code in this editor
if(global.currLevel>2){
if(!enemy_cleared)
{
	var player_in_room = point_in_rectangle(obj_player.x, obj_player.y, linked_room.x1  * CELL_SIZE + CELL_SIZE / 2, linked_room.y1 * CELL_SIZE + CELL_SIZE / 2, linked_room.x2 * CELL_SIZE + CELL_SIZE / 2, linked_room.y2 * CELL_SIZE + CELL_SIZE / 2 - 2);

	if (player_in_room && is_open && !close_delay_active) {
	    close_delay_active = true;
	}

	if (close_delay_active) {
	    if (close_timer > 0) {
	        close_timer -= 1;
	    } else {
	        is_open = false;
	        close_delay_active = false;
			//change sprite here
			sprite_index = spr_tech_door;
			show_debug_message("door closed");
	    }
	}

	if(!is_open){
		var enemy_found = false;
		with (oEnemiesParent) {
		    if (x >= other.linked_room.x1 * CELL_SIZE && x <= other.linked_room.x2 * CELL_SIZE && y >= other.linked_room.y1 * CELL_SIZE && y <= other.linked_room.y2 * CELL_SIZE) {
		        enemy_found = true;
		        exit;
		    }
		}
		if(!enemy_found)
		{
			is_open = true;
			enemy_cleared = true;
			sprite_index = spr_tech_door_open;
			show_debug_message("door open");
		}

	}
}
}
