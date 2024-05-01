/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
text = "Speed +10%";
price = 20 + global.permanent_speed_upgrade * 10;

function upgrade()
{
	show_debug_message("overload upgrade");
	if(global.soul >= price)
	{
		global.soul -= price;
		global.permanent_speed_upgrade += 1;
		record_upgrade_permanent_accum("Player Speed +", 0.1);
		show_debug_message("purchase success");
		price += 10;
	}
	else
	{
		show_debug_message("purchase failed");
		audio_play_sound(invalidSound, 0, false);
	}
}

