/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.revive += 1;
	ds_map_replace(global.upgrade_pool, "obj_upgrade_revive", 1);
	show_debug_message("Upgrade applied: Revive");
	record_upgrade_accum("Revive Chance +", 1);
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Revive chance \n +1";
	ui.upgradeIcon = spr_ui_revive;
	show_debug_message("revive ui created");
}