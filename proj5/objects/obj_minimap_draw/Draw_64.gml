

location_x = floor(obj_player.x / CELL_SIZE)
location_y = floor(obj_player.y / CELL_SIZE)

global.minimap[location_x,location_y] = MAP_STATES.DISCOVERD
global.minimap = minimap

if keyboard_check_pressed(vk_tab){
	_draw_map = !_draw_map
}
if _draw_map{
draw_map()
}