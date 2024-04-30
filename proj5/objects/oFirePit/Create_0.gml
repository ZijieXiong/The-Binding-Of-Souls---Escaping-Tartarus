/// @description Insert description here
// You can write your code in this editor

enum PIT_STATE {
    IDLE,
	PREBURST,
	BURST
}

depth = _obj_player.depth+1;

current_state = PIT_STATE.IDLE;

preburst_time = 1*60;
burst_time = 2*60;

state_end_flag = false;

ember_particle = part_system_create(emberParticle);
smoke_particle = part_system_create(fireSmokeParicle);
fire_particle = part_system_create(firePitParticle);

radius_x = 10;
radius_y = 6;

is_mute = true;

part_emitter_region(ember_particle, 0,  x - radius_x, x +radius_x, y - radius_y, y + radius_y, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_enable(ember_particle, 0, true);

part_emitter_region(smoke_particle, 0,  x - radius_x, x + radius_x, y - radius_y, y + radius_y, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_enable(smoke_particle, 0, false);

part_emitter_region(fire_particle, 0,  x - radius_x, x + radius_x, y - radius_y, y + radius_y, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_enable(fire_particle, 0, false);

soft_burst = function() {
	if(current_state == PIT_STATE.IDLE) {
		current_state = PIT_STATE.PREBURST;
		alarm[0] = preburst_time;
		is_mute = false;
	}
}

hard_burst = function() {
	current_state = PIT_STATE.PREBURST;
	alarm[0] = preburst_time;
	is_mute = true;
}