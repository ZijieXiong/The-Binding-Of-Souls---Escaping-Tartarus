/// @description Insert description here
// You can write your code in this editor
if(fading_in){
	alpha += fade_speed;
	if(alpha>=1)
	{
		alpha = 1;
		fading_in = false;
		show_debug_message("fade in");
		if(!callback_triggered){
			global.currLevel += 1;
			if global.currLevel >= global.boss_layer{
				room_goto(rmBoss)
			}else{
				dm.GenerateNewDungeon();
				callback_triggerd = true;
			}

		}
	}
}
else
{
	alpha -= fade_speed;
	if(alpha <= 0){
		show_debug_message("fade over");
		alpha = 0;
		instance_destroy()
	}
}