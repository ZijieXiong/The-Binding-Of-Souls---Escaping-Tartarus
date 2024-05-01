/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.upgradeNum += 1;
	ds_map_delete(global.upgrade_pool, "obj_upgrade_add_upgrade_option");
	show_debug_message("Upgrade applied: Upgrade +1");
	record_upgrade_once("Upgrade Option +1");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Upgrade option \n +1";
	ui.upgradeIcon = spr_ui_extra;
	show_debug_message("upgrade option UI created");
}