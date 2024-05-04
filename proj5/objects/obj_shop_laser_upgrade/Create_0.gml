event_inherited();

text = "laser drone";
if !global.has_drone price = 100
else price = 999999

function upgrade()
{
	show_debug_message("overload upgrade");
	if(global.soul >= price)
	{
		global.soul -= price;
		global.has_drone += true;
		record_upgrade_once("laser drone")
		show_debug_message("purchase success");
		price = 999999
		audio_play_sound(validSound, 0, false);
	}
	else
	{
		show_debug_message("purchase failed");
		audio_play_sound(invalidSound, 0, false);
	}
}
