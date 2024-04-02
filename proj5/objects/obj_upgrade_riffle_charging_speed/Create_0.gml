/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.riffleChargingSpeed += 0.5;
	show_debug_message("Upgrade applied: Charging Speed");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Charing Speed +50%";
	show_debug_message("Charging Speed UI created");
}