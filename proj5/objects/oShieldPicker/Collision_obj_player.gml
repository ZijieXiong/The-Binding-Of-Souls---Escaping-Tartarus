/// @description Insert description here
// You can write your code in this editor
//if (dm.currLevel mod 5 == 0) {

//}
var picked = pickup_item(spr_shield_icon,obj_shield)
if picked == 1{
	instance_destroy();
	audio_play_sound(itemPick, 0, false);
}



