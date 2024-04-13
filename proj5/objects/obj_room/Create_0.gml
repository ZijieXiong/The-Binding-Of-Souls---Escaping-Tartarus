/// @description Insert description here
// You can write your code in this editor
enemies = [];
doors = [];
hazards = [];

x1 = noone;
x2 = noone;
y1 = noone;
y2 = noone;

enemy_cleared = true;
is_elite = false;
is_open = true;
battle_started = false;

elite_sound = noone;

function debug()
{
	show_debug_message("test");
}

function dropItem()
{	
	var item_pool = global.item_pool;
	if(is_elite){
		item_pool = global.elite_item_pool;
	}
	else
	{
		healthBoosterProb();
	}
	var item = chooseNDifferentUpgrades(item_pool, 1);
	
	if(item[0] != "noone")
	{	
		var posX = x;
		var posY = y;
		var adjusted_x1 = x1 * CELL_SIZE + CELL_SIZE;
		var adjusted_y1 = y1 * CELL_SIZE + CELL_SIZE;
		var adjusted_y2 = y2 * CELL_SIZE;
		var adjusted_x2 = x2 * CELL_SIZE;
		
		var validPos = false;
		var iter = 50;
		while(!validPos && iter < 50)
		{
			if(checkDistance(posX,posY))
			{
				validPos = true;
			}
			else
			{
				show_debug_message("rearrange item pos");
				posX = random_range(adjusted_x1, adjusted_x2);
				posY = random_range(adjusted_y1, adjusted_y2);
				iter++;
			}
		}

		instance_create_layer(x,y,"Dungeon", asset_get_index(item[0]));
	}
}

function checkDistance(posX,posY)
{
	for (var i = 0; i < array_length(hazards); i++) {
		var hazard = hazards[i];
		var offset = sprite_get_width(hazard.sprite_index) * hazard.image_xscale / 2;
		if (point_distance(posX, posY, hazard.x + offset, hazard.y + offset) < 64) {
				return false;
		}
		}
	return true;
}

function healthBoosterProb()
{
	var prob = 100;
	if(obj_player.playerLives == obj_player.healthLimit)
	{
		prob = 0;
	}
	else if(obj_player.playerLives >=2)
	{
		prob = 20;
	}
	ds_map_replace(global.item_pool, "oHeartBooster", prob);
	show_debug_message("heart prob: " + string(ds_map_find_value(global.item_pool, "oHeartBooster")));
}