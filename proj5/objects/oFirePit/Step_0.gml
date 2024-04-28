/// @description Insert description here
// You can write your code in this editor

switch(current_state) {
	case PIT_STATE.IDLE:
		break;
	case PIT_STATE.PREBURST:
		if(state_end_flag) {
			current_state = PIT_STATE.BURST;
			alarm[0] = burst_time;
			state_end_flag = false;
		}
	case PIT_STATE.BURST:
		if(state_end_flag) {
			current_state = PIT_STATE.IDLE;
			state_end_flag = false;
		}
		break;
		
}

