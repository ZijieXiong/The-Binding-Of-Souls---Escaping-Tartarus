/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case States.Idle:
		if(attack_timer > 0){
			attack_timer--;
		}
		else{
			state = States.Attack;
			attack_timer = attack_interval;
		}
		break;
	case States.Attack:
		break;
}