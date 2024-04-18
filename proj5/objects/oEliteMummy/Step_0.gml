/// @description Game Logic
// You can write your code in this editor
event_inherited();

if(_health <= 0){
	//audio_play_sound(enemyDie, 0, false);
	instance_destroy();
}


b_tree.Process();



