// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.item_pool = ds_map_create();
ds_map_add(global.item_pool, "noone", 10);
ds_map_add(global.item_pool, "oHeartBooster", 50);
ds_map_add(global.item_pool, "oShieldPicker", 10);
ds_map_add(global.item_pool, "obj_missile_pickup", 10);

global.elite_item_pool = ds_map_create();
ds_map_add(global.elite_item_pool, "oShieldPicker", 10);
ds_map_add(global.elite_item_pool, "obj_missile_pickup", 10);


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