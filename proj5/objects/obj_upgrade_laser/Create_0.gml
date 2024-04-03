/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	selectRoute(4);
	show_debug_message("Upgrade applied: Laser");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Laser";
	ui.upgradeIcon = spr_laser_beam;
	show_debug_message("laser ui created");
}