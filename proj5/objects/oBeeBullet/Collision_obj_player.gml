if(!global.playerFreeze)
{
	with(other){
		playerLives -= 1;
		audio_play_sound(hitHurt, 0, false);
	}
}
