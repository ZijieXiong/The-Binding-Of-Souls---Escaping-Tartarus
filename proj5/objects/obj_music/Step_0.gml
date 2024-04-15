///// @description Insert description here
//// You can write your code in this editor
//if(!isPlaying)
//{
//	if keyboard_check_pressed(vk_anykey)
//	{
//	    isPlaying = true;
//		timer = delay;
//		//dm.currLevel = 0;
//	}
//}
//else{
//	if(timer > 0)
//	{
//		timer--;
//		if(timer==0)
//		{
//			if (global.currLevel == 1) {
//				audio_play_sound(snd_jungle, 0, true);
//			} else if (global.currLevel ==2) {
//				audio_stop_sound(snd_jungle);
//				audio_play_sound(snd_pyramid_bgm, 0, true);
//			} else if (global.currLevel == 3) {
//				audio_stop_sound(snd_pyramid_bgm);
//				audio_play_sound(snd_scifi, 0, true);
//			} else {
//				audio_play_sound(snd_scifi, 0, true);
//			}
//			//audio_sound_gain(bgm, 0.2, 0);
//			timer = -1;
//		}
//	}
//}
if (global.currLevel == 1) {
	if (!audio_is_playing(snd_jungle)) {
	audio_play_sound(snd_jungle, 0, true);
	}
}
if (global.currLevel == 2) {
	audio_sound_gain(snd_jungle, 0, 2000);
	audio_stop_sound(snd_jungle);
    if (!audio_is_playing(snd_pyramid_bgm)) {
		audio_play_sound(snd_pyramid_bgm, 0, true);
	}
}
if (global.currLevel == 3) {
	audio_sound_gain(snd_pyramid_bgm, 0, 2000);
	audio_stop_sound(snd_pyramid_bgm);
	if (!audio_is_playing(snd_scifi)) {
		audio_play_sound(snd_scifi, 0, true);
	}
}
	


//switch (music_state) {
//	case "Jungle":
//	if (!audio_is_playing(snd_jungle)) {
//		audio_play_sound(snd_jungle, 0, true);
//	}
//	break;
	
//	case "Pyramid":
//	audio_sound_gain(snd_jungle, 0, 2000);
//	audio_stop_sound(snd_jungle);
//	if (!audio_is_playing(snd_pyramid_bgm)) {
//		audio_play_sound(snd_pyramid_bgm, 0, true);
//	}
//	break;
	
//	case "Scifi":
//	audio_sound_gain(snd_pyramid_bgm, 0, 2000);
//	audio_stop_sound(snd_pyramid_bgm);
//	if (!audio_is_playing(snd_scifi)) {
//		audio_play_sound(snd_scifi, 0, true);
//	}
//	break;
	
//	case "Last":
//	if (!audio_is_playing(snd_scifi)) {
//		audio_play_sound(snd_scifi, 0, true);
//	}
//	break;
//}