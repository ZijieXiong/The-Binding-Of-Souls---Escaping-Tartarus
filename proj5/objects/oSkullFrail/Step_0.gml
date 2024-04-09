/// @description Insert description here
// You can write your code in this editor

count++;

switch(current_state)
{
	case FRAIL_STATE.IDLE:
		break;
		
	case FRAIL_STATE.FIRST_WALK:
		
		x = lerp(start_x, target_x, count / first_walk_time);
		y = lerp(start_y, target_y, count / first_walk_time);
		
		if(count >= first_walk_time)
		{
			current_state = FRAIL_STATE.IDLE;
		}
		break;
		
	case FRAIL_STATE.SECOND_WALK:
	
		x = lerp(start_x, target_x, count / first_walk_time);
		y = lerp(start_y, target_y, count / first_walk_time);
		
		if(count >= first_walk_time)
		{
			current_state = FRAIL_STATE.IDLE;
		}
		break;
	
}