function applyUpgrade()
{
	global.shotgun_split = true;
	ds_map_delete(global.upgrade_pool, "obj_upgrade_shotgun_bullet_split");
	show_debug_message("Upgrade applied: Shotgun bullet split");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Shotgun bullet \n split";
	ui.upgradeIcon = spr_shotgun;
	show_debug_message("Shotgun bullet split ui created");
}