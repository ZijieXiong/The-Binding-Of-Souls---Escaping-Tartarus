
var picked = pickup_item(spr_decoy_1,obj_decoy)
if picked == 1{
	instance_destroy();
	audio_play_sound(itemPick, 0, false);
}
