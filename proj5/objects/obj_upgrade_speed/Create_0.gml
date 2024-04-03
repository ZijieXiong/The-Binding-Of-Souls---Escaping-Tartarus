/// @description Insert description here
// You can write your code in this editor

function applyUpgrade()
{
	global.playerSpeedMultiplier += 0.1;
	show_debug_message("Upgrade applied: Speed");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Player speed \n increase by 10%";
	ui.upgradeIcon = spr_player_idle;
	show_debug_message("speed ui created");
}