/// @description Insert description here
// You can write your code in this editor

function applyUpgrade()
{
	global.dmgMultiplier += 0.25;
	show_debug_message("Upgrade applied: Increases Damage");
	record_upgrade_accum("Damage +", 0.25);
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Increase \n 25% damage";
	ui.upgradeIcon = spr_ui_weapon;
	show_debug_message("dmg UI created");
}

