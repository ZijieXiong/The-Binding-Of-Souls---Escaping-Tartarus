if instance_exists(obj_decoy){
	target_obj = obj_decoy
//	instance_change(obj_decoy,true)
	show_debug_message("decoy")
	x= obj_decoy.x
	y= obj_decoy.y
}else if instance_exists(_obj_player){
	show_debug_message("players")
//	instance_change(_obj_player,true)
	target_obj = _obj_player
	x = _obj_player.x
	y = _obj_player.y
}else{
	
}