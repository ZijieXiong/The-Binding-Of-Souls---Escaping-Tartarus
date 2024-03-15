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
			audio_play_sound(snd_background, 0, true);
			timer = -1;
		}
	}
}


