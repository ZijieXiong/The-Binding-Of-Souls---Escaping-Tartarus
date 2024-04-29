spr_list = [spr_decoy_1,spr_decoy_2,spr_decoy_3,spr_decoy_4,spr_decoy_5]

spr_index = choose(0,1,2,3,4)

sprite_index = spr_list[spr_index]
image_xscale = 0.5;
image_yscale = 0.5;
decoyLives = 5;
_flash = 0
is_vulnerable = true;
invulnerable_time_after_damage =0.5;

function TakeDamage(){
	if(is_vulnerable && !global.globalFreeze)
	{
		decoyLives -= 1;
		_flash = 1;
		audio_play_sound(hitHurt, 0, false);
		spr_index = choose(0,1,2,3,4)
		sprite_index = spr_list[spr_index]
		is_vulnerable = false;
		alarm[0] = invulnerable_time_after_damage * 60;
	}
}
