/// @description Insert description here
// You can write your code in this editor
particleSystem = part_system_create_layer("Instances",0)

particle_hit = part_type_create()
part_type_sprite(particle_hit,spr_laser_hit_effect,1,0,0)
part_type_size(particle_hit,0.5,1,0.1,0)
part_type_life(particle_hit,5,15)
//part_type_alpha3(particle_hit,1,0.6,0.2)
part_type_orientation(particle_hit,0,359,0,0,0)