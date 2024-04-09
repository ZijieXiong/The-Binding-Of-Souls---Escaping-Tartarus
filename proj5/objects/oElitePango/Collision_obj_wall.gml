/// @description Insert description here
// You can write your code in this editor

//if(current_state == PANGO_STATE.ROLL)
move_bounce_solid(0);


alarm[0] = 30;

if(!is_hit)
{
	hit_wall_x = x;
	hit_wall_y = y;
	hit_player_x = obj_player.x;
	hit_player_y = obj_player.y;
	is_hit = true;
	
	summon_spike(hit_wall_x, hit_wall_y, hit_player_x, hit_player_y);
}

screenshake(30, 2, 0.2);
show_debug_message("Hit wall!");