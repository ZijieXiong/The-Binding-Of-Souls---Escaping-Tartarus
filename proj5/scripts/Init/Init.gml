#macro CELL_SIZE 48
#macro ENEM_DISTANCE 250
#macro ENEM_HEALTH 2

#region powerups
//permanent
//#macro GRAZE true

////generated powerup
//#macro RICHOCHET false
//#macro HEALTH_BOOST false
global.max_items = 3

global.spr_inventory[0] = -1
global.spr_inventory[1] = -1
global.spr_inventory[2] = -1

global.obj_inventory[0] = -1
global.obj_inventory[1] = -1
global.obj_inventory[2] = -1

global.load_done = false
global.graze = false;
global.richochet = true;
global.bouncesLeft = 0

global.healthBoost = 0;

global.bulletSpeed = 13

global.spawns = [oHeartBooster, oRichochet, oBomb];
global.dropRate = 20;

global.currLevel = 0;

global.dmgMultiplier = 1;
global.playerSpeedMultiplier = 1;
global.shootingIntervalMultiplier = 1;

//shotgun
global.shotgunRange = 1;
global.split_angel = 15;
global.shotgun_bulletcount = 3
global.shotgun_split = false;
//riffle
global.rifflePenetrate = false;
global.riffle_bullet_explosive = false
global.riffleChargingSpeed = 1;

#endregion

enum MAP_STATES{
	BLOCKED,
	CONCEALD,
	DISCOVERD
}

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


//common upgrade init
ds_map_add(global.common_upgrade, "obj_upgrade_damage", 20);
ds_map_add(global.common_upgrade, "obj_upgrade_plus_one_bounce", 20);
ds_map_add(global.common_upgrade, "obj_upgrade_shotgun", 10);
//ds_map_add(global.common_upgrade, "obj_upgrade_laser", 5);
ds_map_add(global.common_upgrade, "obj_upgrade_riffle", 10);
ds_map_add(global.common_upgrade, "obj_upgrade_speed", 10);
ds_map_add(global.common_upgrade, "obj_upgrade_shooting_interval", 20);
ds_map_add(global.common_upgrade, "obj_upgrade_revive", 5);
ds_map_add(global.common_upgrade, "obj_upgrade_add_upgrade_option", 5);

//shotgun upgrade init 
ds_map_add(global.shotgun_upgrade, "obj_upgrade_shotgun_range", 10);
ds_map_add(global.shotgun_upgrade, "obj_upgrade_shotgun_bullet", 10);
ds_map_add(global.shotgun_upgrade, "obj_upgrade_shotgun_bullet_split", 5);
ds_map_add(global.shotgun_upgrade, "obj_upgrade_shotgun_block_attack", 5);
//riffle upgrade init
ds_map_add(global.riffle_upgrade, "obj_upgrade_riffle_penetrate", 5);
ds_map_add(global.riffle_upgrade, "obj_upgrade_riffle_charging_speed", 10);
ds_map_add(global.riffle_upgrade, "obj_upgrade_riffle_explosive", 5);

global.upgrade_objs = ds_list_create();

/// @description reset all parameters to original value
function initParas()
{
	global.upgradeNum = 2;
	
	global.dmgMultiplier = 1;
	global.playerSpeedMultiplier = 1;
	global.shootingIntervalMultiplier = 1;
	global.revive = 0;
	
	global.shotgunRange = 1;
	global.shotgun_split = false;
	global.shotgunBlockAttack = false;
	global.shotgunBlockPenetrate = false;
	global.shotgun_bulletcount = 3;
	
	global.rifflePenetrate = true;
	global.riffleChargingSpeed = 1;

	global.riffle_bullet_explosive = false;

	global.currLevel = 1;
	global.playerFreeze = false;
	global.globalFreeze = false;
	global.bouncesLeft = 0;
	global.richochet = false;
	
	global.max_items = 3
	global.item_amount = 0;

	global.spr_inventory[0] = -1
	global.spr_inventory[1] = -1
	global.spr_inventory[2] = -1

	global.obj_inventory[0] = -1
	global.obj_inventory[1] = -1
	global.obj_inventory[2] = -1

	initUpgradePool();
}

initParas();

/// @description initUpgradePool();
/// @param none
/// @return none
function initUpgradePool()
{
	global.upgrade_pool = ds_map_create();
	addSelecteRouteUpgrades(global.common_upgrade);
    
    // test
	var keys = ds_map_keys_to_array(global.upgrade_pool);
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
/// @param upgradesMap variable that stores upgrades
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

/// @description choose n different upgrades
/// @param upgradesMap variable that stores upgrades
/// @param n number of upgrades
/// @return chosenKeys chosen upgrades
function chooseNDifferentUpgrades(upgradesMap, n) {
    var chosenKeys = [];
    var tempMap = ds_map_create();
    ds_map_copy(tempMap, upgradesMap);

    n = min(n, ds_map_size(tempMap));

    while (array_length(chosenKeys) < n) {
        var totalProbability = calculateTotalProbability(tempMap);
        if (totalProbability <= 0) break;
        
        var randomProb = random(totalProbability);
        var cumulativeProb = 0;
        var keys = ds_map_keys_to_array(tempMap);
        
        for (var i = 0; i < array_length(keys); ++i) {
            var key = keys[i];
            var prob = ds_map_find_value(tempMap, key);
            cumulativeProb += prob;
            
            if (randomProb <= cumulativeProb) {
                array_push(chosenKeys, key);
                ds_map_delete(tempMap, key);
                break;
            }
        }
    }

    ds_map_destroy(tempMap);

    return chosenKeys;
}

/// @description drop all routes from upgrade pool once selected a route
function dropUpgradeRoutes(){
	var keysToDelete = ["obj_upgrade_shotgun", "obj_upgrade_laser", "obj_upgrade_riffle"];
	for (var i = 0; i < array_length(keysToDelete); i++) {
		var _key = keysToDelete[i];
		if (ds_map_exists(global.upgrade_pool, _key)) {
		    ds_map_delete(global.upgrade_pool, _key);
		}
	}
}

/// @description select a certain upgrade route
/// @param route: integer
function selectRoute(route){
	var player = instance_find(obj_player, 0);
	switch(route)
	{
		case 2:
			player.ChangeWeapon(2);
			addSelecteRouteUpgrades(global.shotgun_upgrade);
			break;
		case 3:
			player.ChangeWeapon(3);
			addSelecteRouteUpgrades(global.riffle_upgrade);
			break;
		case 4:
			player.ChangeWeapon(4);
			addSelecteRouteUpgrades(global.laser_upgrade);
			break;
	}
	dropUpgradeRoutes();
}

/// @description add all upgrades in a certain route to upgrade pool
/// @description upgrade route map variable
function addSelecteRouteUpgrades(routeUpgrade)
{
	var keys = ds_map_keys_to_array(routeUpgrade);
    
    for (var i = 0; i < array_length(keys); ++i) {
        var key = keys[i];
        var value = ds_map_find_value(routeUpgrade, key);
        ds_map_add(global.upgrade_pool, key, value);
    }
}