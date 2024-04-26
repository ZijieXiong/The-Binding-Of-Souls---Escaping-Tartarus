/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.shotgunRange += 0.1;
	show_debug_message("Upgrade applied: Shotgun Range");
	record_upgrade_accum("Shotgun Range +", 0.1);
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Range \n +10%";
	ui.upgradeIcon = spr_ui_shotgun;
	show_debug_message("shotgun range ui created");
}