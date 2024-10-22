/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	selectRoute(3);
	show_debug_message("Upgrade applied: Riffle");
	record_upgrade_once("Upgrade to Riffle");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Riffle\nLeft click:\ncharged shoot";
	ui.upgradeIcon = spr_ui_riffle;
	show_debug_message("riffle ui created");
}