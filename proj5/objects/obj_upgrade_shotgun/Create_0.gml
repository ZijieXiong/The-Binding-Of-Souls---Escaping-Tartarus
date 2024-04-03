/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	selectRoute(2);
	show_debug_message("Upgrade applied: Shotgun");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Shotgun";
	ui.upgradeIcon = spr_ui_shotgun;
	show_debug_message("shotgun ui created");
}