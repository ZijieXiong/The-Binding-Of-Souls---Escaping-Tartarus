/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
text = "damage +25%";
price = 15 + global.permanent_damage_upgrade * 5;

function upgrade()
{
	show_debug_message("overload upgrade");
	if(global.soul >= price)
	{
		global.soul -= price;
		global.permanent_damage_upgrade += 1;
		record_upgrade_permanent_accum("Damage +", 0.25);
		show_debug_message("purchase success");
		price += 5;
	}
	else
	{
		show_debug_message("purchase failed");
		audio_play_sound(invalidSound, 0, false);
	}
}

