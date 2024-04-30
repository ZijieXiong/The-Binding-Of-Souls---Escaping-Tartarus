/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	_obj_player.healthLimit += 1;
	_obj_player.Heal(1);
	show_debug_message("Upgrade applied: Increases Health Limit");
	record_upgrade_accum("Health Limit +", 1);
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Increase \n 1 Health Limit";
	ui.upgradeIcon = spr_ui_player;
	show_debug_message("Health Limit UI created");
}
