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
		elite_item_prob();
	}
	else
	{
		healthBoosterProb();
		item_prob();
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
		var iter = 0;
		while(!validPos && iter < 50)
		{	
			if(check_distance(posX,posY))
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

		instance_create_layer(posX,posY,"Dungeon", asset_get_index(item[0]));
	}
}

function check_distance(posX,posY)
{
	show_debug_message("hazard num: " + string(array_length(hazards)));
	for (var i = 0; i < array_length(hazards); i++) {
		var hazard = hazards[i];
		var offset = sprite_get_width(hazard.sprite_index) * hazard.image_xscale / 2;
		show_debug_message("posX: "+ string(posX) + " posY: " + string(posY));
		show_debug_message("hazard y: " + string(hazard.y) + " hazard x: " + string(hazard.x));
		show_debug_message(place_meeting(posX,posY, hazard));
		/*if (place_meeting(posX,posY,hazard)) {
				return false;
		}*/
		if(collision_circle(posX,posY,8,[obj_wall], true, 0))
		{
			return false;
		}
	}
	return true;
}

function healthBoosterProb()
{
	var prob = 100;
	if(obj_player.playerLives >= obj_player.healthLimit)
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

function item_prob()
{
	var prob = 10;
	if(global.item_amount >= global.max_items)
	{
		prob = 0;
	}
	set_item_prob(global.item_pool, prob);
}

function elite_item_prob()
{
	var prob = 10;
	if(global.item_amount >= global.max_items)
	{
		prob = 0;
	}
	set_item_prob(global.elite_item_pool, prob);
}
