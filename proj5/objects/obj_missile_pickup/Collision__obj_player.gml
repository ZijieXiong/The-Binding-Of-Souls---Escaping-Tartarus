
var picked = pickup_item(spr_missle_pickup_gai,obj_missile)
if picked == 1{
	instance_destroy();
	audio_play_sound(itemPick, 0, false);
}

