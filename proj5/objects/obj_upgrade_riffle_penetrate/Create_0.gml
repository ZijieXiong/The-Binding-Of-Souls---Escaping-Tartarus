/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.rifflePenetrate = true;
	ds_map_delete(global.upgrade_pool, "obj_upgrade_riffle_penetrate");
	show_debug_message("Upgrade applied: Riffle Penetrate");
	record_upgrade_once("Bullet Penetrate Enemy");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Bullet \n penetrate enemies";
	ui.upgradeIcon = spr_ui_riffle;
	show_debug_message("riffle penetrate ui created");
}