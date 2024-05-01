/// @description Insert description here
// You can write your code in this editor
if (global.game_pass) {
	audio_play_sound(snd_win, 0, false);
} else {
	audio_play_sound(gameFail, 0, false);