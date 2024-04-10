// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_mini_map(_w,_h){
	global.minimap = []
	for(var xx = 0; xx<_w;xx++){
		for(var yy = 0; yy< _h; yy++){
			if(mp_grid_get_cell(global.mp_grid,xx,yy)== -1){
				global.minimap[xx,yy] = MAP_STATES.BLOCKED
			}else{
				global.minimap[xx,yy] = MAP_STATES.CONCEALD
			}
		}
	}
	global.load_done = true
}