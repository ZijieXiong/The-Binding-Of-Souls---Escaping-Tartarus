function applyUpgrade()
{
	global.riffle_bullet_explosive = true;
	ds_map_delete(global.upgrade_pool, "obj_upgrade_riffle_explosive");
	show_debug_message("Upgrade applied: Riffle explosive");
	record_upgrade_once("Bullet Explosive at Max Charge");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Bullet explosive at max charge";
	ui.upgradeIcon = spr_ui_riffle;
	show_debug_message("riffle explosive ui created");
}