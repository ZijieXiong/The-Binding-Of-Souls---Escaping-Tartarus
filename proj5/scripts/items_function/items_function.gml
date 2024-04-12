// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pickup_item(_spr,_obj){
	
	for(i = 0;i < global.max_items;i++){
		if(global.spr_inventory[i] == -1){
			global.spr_inventory[i] = _spr
			global.obj_inventory[i] = _obj
			return(1);
		}
	}
	return(0);
}

function drop_item(_spr){
	for(i = 0;i < global.max_items;i++){
		if(global.spr_inventory[i] == _spr){
			global.spr_inventory[i] = -1
			global.obj_inventory[i] = -1
			return(1);
		}
	}
	return(0);
}