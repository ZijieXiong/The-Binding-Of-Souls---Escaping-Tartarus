/// @description Insert description here
// You can write your code in this editor
global.playerFreeze = true;
var chosenUpgrades = chooseNDifferentUpgrades(global.upgrade_pool, global.upgradeNum);

/*var midX = display_get_gui_width() / 2;
var midY = display_get_gui_height() / 2;

for (var i = 0; i < global.upgradeNum; i++) {
    var upgradeInstance = instance_create_layer(midX + (i * 300 - 150), midY, "Instances", asset_get_index(chosenUpgrades[i]));
    upgradeInstance.createUI(midX + (i * 300 - 150), midY);
	ds_list_add(global.upgrade_objs, upgradeInstance);
}
var healthLimitUpgrade = instance_create_layer(midX + global.upgradeNum * 300 - 150, midY, "Instances", obj_upgrade_health_limit);
healthLimitUpgrade.createUI(midX +  global.upgradeNum * 300 - 150, midY);
ds_list_add(global.upgrade_objs, healthLimitUpgrade);*/

var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();

var upgradeWidth = 130;
var spacing = 105;
if global.upgradeNum == 2 spacing = floor(guiWidth / 3) - 120;
var totalUpgradeWidth = upgradeWidth * global.upgradeNum + spacing * (global.upgradeNum - 1);

var startX = 110;
if global.upgradeNum == 2 starX = 140;
for (var i = 0; i < global.upgradeNum; i++) {
    var posX = startX + (spacing + upgradeWidth) * i;  // Position each upgrade evenly
    var upgradeInstance = instance_create_layer(posX, guiHeight / 2, "Instances", asset_get_index(chosenUpgrades[i]));
    upgradeInstance.createUI(posX, guiHeight / 2);
    ds_list_add(global.upgrade_objs, upgradeInstance);
}

// Add the special health limit upgrade
var healthLimitUpgradePosX = startX + (upgradeWidth + spacing) * global.upgradeNum;
var healthUpgrade = obj_upgrade_health_limit;
if(_obj_player.playerLives <= 2)
{
	healthUpgrade = obj_upgrade_restore_all_health;
}
var healthLimitUpgrade = instance_create_layer(healthLimitUpgradePosX, guiHeight / 2, "Instances",healthUpgrade);
healthLimitUpgrade.createUI(healthLimitUpgradePosX, guiHeight / 2);
ds_list_add(global.upgrade_objs, healthLimitUpgrade);

audio_play_sound(openChest, 0, false);
instance_destroy();