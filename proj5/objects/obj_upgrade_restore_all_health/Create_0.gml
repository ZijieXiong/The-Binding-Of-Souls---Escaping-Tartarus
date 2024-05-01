/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	_obj_player.Heal(_obj_player.healthLimit);
	audio_play_sound(powerUp, 0, false);
	show_debug_message("Upgrade applied: Restore all health");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Restore all health";
	ui.upgradeIcon = spr_heartboost;
	show_debug_message("restore ui created");
}