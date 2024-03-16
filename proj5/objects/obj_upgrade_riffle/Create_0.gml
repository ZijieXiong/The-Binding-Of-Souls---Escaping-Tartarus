/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	show_debug_message("Upgrade applied: Riffle");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Riffle";
	show_debug_message("riffle ui created");
}