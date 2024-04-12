/// @description Insert description here
// You can write your code in this editor
if(!enemy_cleared && is_open)
{
	var player_in_room = point_in_rectangle(obj_player.x, obj_player.y, x1  * CELL_SIZE + CELL_SIZE / 2, y1 * CELL_SIZE + CELL_SIZE / 2, x2 * CELL_SIZE + CELL_SIZE / 2, y2 * CELL_SIZE + CELL_SIZE / 2 - 2);

	if (player_in_room) {
		doorClose();
	}
}
else if(!enemy_cleared && battle_started)
{
	var enemy_found = false;
	with (oEnemiesParent) {
		if (x >= other.x1 * CELL_SIZE && x <= other.x2 * CELL_SIZE + CELL_SIZE && y >= other.y1 * CELL_SIZE && y <= other.y2 * CELL_SIZE + CELL_SIZE) {
		    enemy_found = true;
		    exit;
		}
	}with (obj_enemy_portal) {
		if (x >= other.x1 * CELL_SIZE && x <= other.x2 * CELL_SIZE + CELL_SIZE && y >= other.y1 * CELL_SIZE && y <= other.y2 * CELL_SIZE + CELL_SIZE) {
		    enemy_found = true;
		    exit;
		}
	}
	if(!enemy_found)
	{
		doorOpen();
	}
}

function doorClose()
{
	is_open = false;
	for(var i = 0; i < array_length(enemies); i++)
	{
		//show_debug_message(enemies[i]);
		enemies[i].openPortal();
	}
	if(is_elite && !elite_sound)
	{
		elite_sound = audio_play_sound(eliteEnemyDetected,0,false);
	}
	for(var i = 0; i < array_length(doors);i++)
	{
		doors[i].close();
	}
	battle_started = true;
}

function doorOpen()
{	
	battle_started = false;
	is_open = true;
	enemy_cleared = true;
	for(var i = 0; i < array_length(doors);i++)
	{
		doors[i].open();
	}
}