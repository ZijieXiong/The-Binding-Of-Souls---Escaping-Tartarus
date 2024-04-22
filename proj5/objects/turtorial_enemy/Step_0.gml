/// @description Insert description here
// You can write your code in this editor

if(_health <= 0){
	audio_play_sound(enemyDie, 0, false);
	instance_destroy();
}