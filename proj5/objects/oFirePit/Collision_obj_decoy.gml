if(!global.playerFreeze&& current_state==PIT_STATE.BURST)
{
	with(other){
		TakeDamage();
	}
}
