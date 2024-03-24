/// @description Insert description here
// You can write your code in this editor

function applyUpgrade()
{
	global.playerSpeedMultiplier += 0.2;
	show_debug_message("Upgrade applied: Speed");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Player speed increase by 20%";
	show_debug_message("speed ui created");
}