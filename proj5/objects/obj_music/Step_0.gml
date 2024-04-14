/// @description Insert description here
// You can write your code in this editor
if(!isPlaying)
{
	if keyboard_check_pressed(vk_anykey)
	{
	    isPlaying = true;
		timer = delay;
		//dm.currLevel = 0;
		
	}
}
else{
	if(timer > 0)
	{
		timer--;
		if(timer==0)
		{
			if (global.currLevel == 1) {
				var bgm = audio_play_sound(snd_jungle, 0, true);
			}
			else if (global.currLevel == 2) {
				var bgm = audio_play_sound(snd_pyramid_bgm, 0, true);
			}
			else if (global.currLevel > 2) {
				var bgm = audio_play_sound(snd_scifi, 0, true);
			}
			audio_sound_gain(bgm, 0.2, 0);
			timer = -1;
		}
	}
}


