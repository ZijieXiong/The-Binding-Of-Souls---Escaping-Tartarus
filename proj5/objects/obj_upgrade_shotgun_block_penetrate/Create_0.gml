/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.shotgunBlockPenetrate = true;
	ds_map_delete(global.upgrade_pool, "obj_upgrade_shotgun_block_penetrate");
	show_debug_message("Upgrade applied: Shotgun block penetrate");
	record_upgrade_once("Bullet can block and penetrate attacks");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Bullet can block and penetrate attacks";
	ui.upgradeIcon = spr_ui_shotgun;
	show_debug_message("shotgun block penetrate ui created");
}