#macro CELL_SIZE 16
#macro ENEM_DISTANCE 250
#macro ENEM_HEALTH 2

#region powerups
//permanent
//#macro GRAZE true

////generated powerup
//#macro RICHOCHET false
//#macro HEALTH_BOOST false


global.graze = false;
global.richochet = false;
global.healthBoost = 0;

global.spawns = [oHeartBooster, oRichochet, oBomb];
global.dropRate = 20;

#endregion

enum CELL_TYPES {
	WALL,
	ROOM,
	HALLWAY,
	COUNT
}

enum DIRECTIONS {
	NORTH,
	WEST,
	SOUTH,
	EAST,
	COUNT
}

randomize();

global.common_upgrade = ds_map_create();
global.shotgun_upgrade = ds_map_create();
global.laser_upgrade = ds_map_create();
global.riffle_upgrade = ds_map_create();
global.upgrade_pool = ds_map_create();

ds_map_add(global.common_upgrade, "obj_upgrade_damage", 30);
ds_map_add(global.common_upgrade, "obj_upgrade_shotgun", 5);
ds_map_add(global.common_upgrade, "obj_upgrade_laser", 5);
ds_map_add(global.common_upgrade, "obj_upgrade_riffle", 5);

initUpgradePool();

global.upgrade_objs = ds_list_create();

/// @description initUpgradePool();
/// @param none
/// @return none
function initUpgradePool()
{
	global.upgrade_pool = ds_map_create();
	var keys = ds_map_keys_to_array(global.common_upgrade);
    
    for (var i = 0; i < array_length(keys); ++i) {
        var key = keys[i];
        var value = ds_map_find_value(global.common_upgrade, key);
        ds_map_add(global.upgrade_pool, key, value);
    }
    
    // test
    for (var i = 0; i < array_length(keys); ++i) {
        var key = keys[i];
        show_debug_message(key + ": " + string(ds_map_find_value(global.upgrade_pool, key)));
    }
}

/// @description calculateTotalProbability
/// @param upgradesMap
/// @return totalProbability
function calculateTotalProbability(upgradesMap) {
    var totalProbability = 0;
    var keys = ds_map_keys_to_array(upgradesMap);
    
    for (var i = 0; i < array_length(keys); ++i) {
        var key = keys[i];
        var value = ds_map_find_value(upgradesMap, key);
        totalProbability += value;
    }
    
    return totalProbability;
}

/// @description chooseTwoDifferentUpgrades
/// @param upgradesMap
/// @return chosenUpgrades

function chooseTwoDifferentUpgrades(upgradesMap) {
    var chosenKeys = [];
    var tempMap = ds_map_create();
	ds_map_copy(tempMap, upgradesMap);
    var totalProbability = calculateTotalProbability(tempMap);
    
    // pick 1st update
    var randomProb = random(totalProbability);
    var cumulativeProb = 0;
    var keys = ds_map_keys_to_array(tempMap);
    
    for (var i = 0; i < array_length(keys); ++i) {
        var key = keys[i];
        var prob = ds_map_find_value(tempMap, key);
        cumulativeProb += prob;
        
        if (randomProb <= cumulativeProb) {
            array_push(chosenKeys, key);
			//get rid of the first pick incase of repetition
            ds_map_delete(tempMap, key);
            break;
        }
    }
    
    // pick 2nd upgrade
    totalProbability = calculateTotalProbability(tempMap);
    randomProb = random(totalProbability);
    cumulativeProb = 0;
    
    keys = ds_map_keys_to_array(tempMap);
    for (var i = 0; i < array_length(keys); ++i) {
        var key = keys[i];
        var prob = ds_map_find_value(tempMap, key);
        cumulativeProb += prob;
        
        if (randomProb <= cumulativeProb) {
            array_push(chosenKeys, key);
            break;
        }
    }

    // clear
    ds_map_destroy(tempMap);

    return chosenKeys;
}