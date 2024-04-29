if(!global.playerFreeze)
{
	//playerLives -= 1;
	//audio_play_sound(hitHurt, 0, false);
	TakeDamage();
	with(other){
		instance_destroy()
	}
}

