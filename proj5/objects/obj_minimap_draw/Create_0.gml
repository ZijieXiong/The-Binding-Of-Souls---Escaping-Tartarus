gwidth = display_get_gui_width() -  display_get_gui_width() / 10
gheight = display_get_gui_height() -  display_get_gui_height() /1.1
spacing = 4
_draw_map = false

minimap = global.minimap
rows = array_height_2d(minimap) - 1
cols = array_length_2d(minimap,0) -1
max_size_x = rows * spacing;
max_size_y = cols * spacing;

gwidth = lerp(gwidth,display_get_gui_width() - max_size_x,0.1)
gheight = lerp(gheight,display_get_gui_height() - max_size_y,0.1)
spacing = lerp(spacing,4,0.1)

location_x = obj_player.x
location_y = obj_player.y
global.minimap[location_x,location_y] = MAP_STATES.DISCOVERD
global.minimap = minimap
room_size = array_height_2d(global.global_room);

function draw_map(){

	for(var rx = 0; rx <= rows; rx++){
		var colls = array_length_2d(minimap,rx) -1
		for(var cy = 0; cy<= colls;cy++){
			var xx = (gwidth - (max_size_x / 2)) + (rx * spacing);
			var yy = (gheight - (max_size_y / 2)) + (cy * spacing);
//			show_debug_message("map x" + string(location_x))
//			show_debug_message("map y " + string(location_y))
//			show_debug_message("rx" + string(rx))
//			show_debug_message("cy " + string(cy))
//			if(minimap[rx,cy] == MAP_STATES.DISCOVERD) show_debug_message("dis")
			switch(global.minimap[rx,cy]){
				case MAP_STATES.CONCEALD:
					draw_set_color(c_gray);
					draw_rectangle(xx,yy,xx+spacing,yy+spacing,false)
					break;
				case MAP_STATES.BLOCKED:
					draw_set_color(c_dkgray);
					draw_rectangle(xx,yy,xx+spacing,yy+spacing,false)
					break;
			    case MAP_STATES.DISCOVERD:
					draw_set_color(c_white);
					draw_rectangle(xx,yy,xx+spacing,yy+spacing,false)
					break;
			}
			
		}
	}
	var px = (gwidth - (max_size_x / 2)) + (location_x * spacing);
	var py = (gheight - (max_size_y / 2)) + (location_y * spacing);
	draw_set_color(c_red)
	draw_rectangle(px,py,px+spacing,py+spacing,false)
}

//draw_map()