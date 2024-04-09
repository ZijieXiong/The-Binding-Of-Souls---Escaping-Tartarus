if keyboard_check_pressed(vk_space)
{
    //dm.currLevel = 0;
	audio_stop_sound(fail_sound);
	room_goto(rmDungeon);
}
