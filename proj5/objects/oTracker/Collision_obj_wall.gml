if (point_distance(obj_player_main.x, obj_player_main.y, x, y) < ENEM_DISTANCE) {
	var _found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player_main.x,obj_player_main.y,choose(0,1))
	if _found_player{
		path_start(path,trackerSpeed,path_action_stop,false)
	}
}