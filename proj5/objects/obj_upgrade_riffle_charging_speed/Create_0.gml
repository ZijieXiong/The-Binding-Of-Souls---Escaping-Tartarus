/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.riffleChargingSpeed += 0.5;
	show_debug_message("Upgrade applied: Charging Speed");
	record_upgrade_accum("Riffle Charging Speed +", 0.5);
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Charing Speed \n +50%";
	ui.upgradeIcon = spr_ui_riffle;
	show_debug_message("Charging Speed UI created");
}