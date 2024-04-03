/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.shotgunBlockAttack = true;
	ds_map_delete(global.upgrade_pool, "obj_upgrade_shotgun_block_attack");
	ds_map_add(global.upgrade_pool, "obj_upgrade_shotgun_block_penetrate", 5);
	show_debug_message("Upgrade applied: Shotgun block attack");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Bullet can block bullet";
	ui.upgradeIcon = spr_shotgun;
	show_debug_message("shotgun block attack ui created");
}