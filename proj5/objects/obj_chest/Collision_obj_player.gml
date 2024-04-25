/// @description Insert description here
// You can write your code in this editor

var chosenUpgrades = chooseNDifferentUpgrades(global.upgrade_pool, global.upgradeNum);

var midX = display_get_gui_width() / 2;
var midY = display_get_gui_height() / 2;

for (var i = 0; i < global.upgradeNum; i++) {
    var upgradeInstance = instance_create_layer(midX + (i * 300 - 150), midY, "Instances", asset_get_index(chosenUpgrades[i]));
    upgradeInstance.createUI(midX + (i * 300 - 150), midY);
	ds_list_add(global.upgrade_objs, upgradeInstance);
}
var healthLimitUpgrade = instance_create_layer(midX + global.upgradeNum * 300 - 150, midY, "Instances", obj_upgrade_health_limit);
healthLimitUpgrade.createUI(midX +  global.upgradeNum * 300 - 150, midY);
ds_list_add(global.upgrade_objs, healthLimitUpgrade);
audio_play_sound(openChest, 0, false);
instance_destroy();