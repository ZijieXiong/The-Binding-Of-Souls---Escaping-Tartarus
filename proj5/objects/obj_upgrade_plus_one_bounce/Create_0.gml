
function applyUpgrade()
{
	global.bouncesLeft += 1;
	global.richochet = true;
	/*
	var _prob = ds_map_find_value(global.upgrade_pool,"obj_upgrade_plus_one_bounce");
	_prob -= 3;
	if(_prob <= 0){
		ds_map_delete(global.upgrade_pool,"obj_upgrade_plus_one_bounce");
	}else{
		ds_map_replace(global.upgrade_pool,"obj_upgrade_plus_one_bounce",_prob);
	}
	show_debug_message(_prob);
	*/
	show_debug_message("Upgrade applied: +1 bullet bounce");

}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "bullet bounce \n +1";
	ui.upgradeIcon = spr_ui_weapon;
	show_debug_message("+1 bounce UI created");
}

