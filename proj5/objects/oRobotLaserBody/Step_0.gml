/// @description Insert description here
// You can write your code in this editor
if(++life_time_counter>life_time) {
	audio_stop_sound(laserElite);
	instance_destroy();
}