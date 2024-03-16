/// @description Insert description here
// You can write your code in this editor

var chosenUpgrades = chooseTwoDifferentUpgrades(global.upgrade_pool);
if (array_length(chosenUpgrades) > 0) {
    show_debug_message(string(chosenUpgrades[0]));
} else {
    show_debug_message("No upgrades chosen.");
}

instance_destroy();