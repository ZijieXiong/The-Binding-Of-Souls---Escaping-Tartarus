
location_x = floor(_obj_player.x / CELL_SIZE)
location_y = floor(_obj_player.y / CELL_SIZE)

global.minimap[location_x,location_y] = MAP_STATES.DISCOVERD
global.minimap = minimap

for(var i = 0; i < room_size; i++){
	var check_room = global.global_room[i]
	var room_obj = check_room[0]
	var x1 = room_obj.x1
	var x2 = room_obj.x2
	var y1 = room_obj.y1
	var y2 = room_obj.y2

	var player_in_room = point_in_rectangle(_obj_player.x, _obj_player.y, x1  * CELL_SIZE + CELL_SIZE / 2, y1 * CELL_SIZE + CELL_SIZE / 2, x2 * CELL_SIZE + CELL_SIZE / 2, y2 * CELL_SIZE + CELL_SIZE / 2 - 2);
	if (player_in_room) and check_room[1] == MAP_STATES.BLOCKED {
		check_room[1] = MAP_STATES.DISCOVERD
		for(var _x = x1; _x <= x2;_x++){
			for(var _y = y1; _y <= y2; _y++){
				global.minimap[_x ,_y ] = MAP_STATES.DISCOVERD
			}
		}
	}
}

//draw_map()

/*if keyboard_check_pressed(vk_tab){
	global._draw_map = !global._draw_map
}*/
draw_set_font(fnt_label);
if global._draw_map{
draw_map()
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(display_get_gui_width()-10, 110, "Level: " + string(global.currLevel));
draw_sprite(soul,0,display_get_gui_width()-60,140)
draw_text(display_get_gui_width()-6, 140, string(global.soul));
//draw_text(display_get_gui_width()-10, 130, "Soul: " + string(global.soul));
}else{
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(display_get_gui_width()-10, 20, "Level: " + string(global.currLevel));
draw_sprite_ext(soul,0,display_get_gui_width()-40,40,1,1,0,c_white,1)
draw_text(display_get_gui_width()-6, 40, string(global.soul));
//draw_text(display_get_gui_width()-10, 40, "Soul: " + string(global.soul));
}

