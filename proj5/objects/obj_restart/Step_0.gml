if keyboard_check_pressed(vk_space)
{
    //dm.currLevel = 0;
	audio_stop_sound(gameFail);
	room_goto(rmDungeon);
}
