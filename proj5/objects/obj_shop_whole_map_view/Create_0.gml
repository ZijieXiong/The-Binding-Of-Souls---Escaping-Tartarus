/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
text = "Press O to \nview whole map";
price = 200;
if(global.view_whole_map)
{
	instance_destroy(button);
	price = "inf";
}

function upgrade()
{
	show_debug_message("overload upgrade");
	if(global.soul >= price)
	{
		global.soul -= price;
		global.view_whole_map = true;
		price = "inf"
		record_upgrade_permanent_once("View whole map");
		instance_destroy(button);
		show_debug_message("purchase success");
	}
	else
	{
		show_debug_message("purchase failed")
		audio_play_sound(invalidSound, 0, false);
	}
}
