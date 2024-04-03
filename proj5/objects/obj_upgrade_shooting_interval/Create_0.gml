/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.shootingIntervalMultiplier -= 0.1;
	if(global.shootingIntervalMultiplier <= 0.3)
	{
		ds_map_delete(global.upgrade_pool, "obj_upgrade_shooting_interval");
	}
	show_debug_message("Upgrade applied: Shooting interval");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Shooting Interval \n -10%";
	ui.upgradeIcon = spr_pistol;
	show_debug_message("shooting interval UI created");
}