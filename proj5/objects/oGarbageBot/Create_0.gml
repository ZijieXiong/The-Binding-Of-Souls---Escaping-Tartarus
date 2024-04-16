event_inherited()

_health = 100 + global.currLevel * 10;
_moveSpeed = 3 + global.currLevel * 10;
last_sprite = sprite_index
_trolling = [spr_garbage_disposal_troll1,spr_garbage_disposal_troll2]

_choice = 0

_player_distance = 35
_facing = 1

calc_path_timer = irandom(60)
calc_path_delay = 30
function die(){
	sprite_index = spr_garbage_disposal_die
	if (last_sprite != spr_garbage_disposal_die) {
		image_index = 0;
		last_sprite = sprite_index;
	}
	if((sprite_index == spr_garbage_disposal_die) && (image_index >= (sprite_get_number(sprite_index) - 1))){
		instance_destroy()
	}
}