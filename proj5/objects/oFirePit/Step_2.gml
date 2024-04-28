/// @description Insert description here
// You can write your code in this editor

switch(current_state) {
	case PIT_STATE.IDLE:
		sprite_index = spr_red_pit_0;
		part_emitter_enable(ember_particle, 0, true);
		part_emitter_enable(smoke_particle, 0, false);
		part_emitter_enable(fire_particle, 0, false);
		break;
	case PIT_STATE.PREBURST:
		sprite_index = spr_red_pit_1;
		part_emitter_enable(ember_particle, 0, true);
		part_emitter_enable(smoke_particle, 0, true);
		part_emitter_enable(fire_particle, 0, false);
		break;
	case PIT_STATE.BURST:
		sprite_index = spr_red_pit_1;
		part_emitter_enable(ember_particle, 0, true);
		part_emitter_enable(smoke_particle, 0, false);
		part_emitter_enable(fire_particle, 0, true);
		break;
		
}