// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.item_pool = ds_map_create();
ds_map_add(global.item_pool, "obj_chest", 1);
ds_map_add(global.item_pool, "noone", 20);
ds_map_add(global.item_pool, "oHeartBooster", 50);
ds_map_add(global.item_pool, "oShieldPicker", 10);
ds_map_add(global.item_pool, "o_decoy_pickup", 10000);
ds_map_add(global.item_pool, "obj_missile_pickup", 10);

global.items = ["oShieldPicker", "obj_missile_pickup","o_decoy_pickup"];

global.elite_item_pool = ds_map_create();
ds_map_add(global.elite_item_pool, "obj_chest", 20);
ds_map_add(global.elite_item_pool, "oShieldPicker", 10);
ds_map_add(global.elite_item_pool, "obj_missile_pickup", 10);
ds_map_add(global.elite_item_pool, "o_decoy_pickup", 10);


function pickup_item(_spr,_obj){

	for(i = 0;i < global.max_items;i++){
		if(global.spr_inventory[i] == -1){
			global.item_amount += 1;
			global.spr_inventory[i] = _spr
			global.obj_inventory[i] = _obj
			return(1);
		}
	}
	return(0);
}

function drop_item(_spr){
	global.item_amount -= 1;
	for(i = 0;i < global.max_items;i++){
		if(global.spr_inventory[i] == _spr){
			global.spr_inventory[i] = -1
			global.obj_inventory[i] = -1
			return(1);
		}
	}
	return(0);
}

function move_item(){
	if global.spr_inventory[1] != -1 {
		global.spr_inventory[0] = global.spr_inventory[1]
		global.obj_inventory[0] = global.obj_inventory[1]
		global.spr_inventory[1] = -1
		global.obj_inventory[1] = -1
	}
	if global.spr_inventory[2] != -1 {
		global.spr_inventory[1] = global.spr_inventory[2]
		global.obj_inventory[1] = global.obj_inventory[2]
		global.spr_inventory[2] = -1
		global.obj_inventory[2] = -1
	}

}

function set_item_prob(pool, prob){
	for(var i = 0; i < array_length(global.items); i++){
		ds_map_replace(pool, global.items[i], prob);
		show_debug_message(ds_map_find_value(pool, global.items[i]));
	}
}