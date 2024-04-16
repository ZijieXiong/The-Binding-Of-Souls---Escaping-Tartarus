var _dis = distance_to_object(obj_player)

if(_health <= 0){
	die()
}
var dir = sign(obj_player.x - x)
_facing = dir
if (_dis > _player_distance) {
	if calc_path_timer-- <= 0 {
		calc_path_timer = calc_path_delay
		var _found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player.x,obj_player.y,choose(0,1))
		if _found_player{
			sprite_index = spr_garbage_disposal_move
			path_start(path,_moveSpeed,path_action_stop,false)
		}
	}

}
else{
	path_end()
	if(sprite_index == spr_garbage_disposal_troll1 || sprite_index == spr_garbage_disposal_troll2 || sprite_index == spr_garbage_disposal_move) 
	&& (image_index >= (sprite_get_number(sprite_index) - 1)) {
		sprite_index = _trolling[choose(0,1)]
	}
	
}

if (last_sprite != sprite_index) {
	image_index = 0;
	last_sprite = sprite_index;
}
