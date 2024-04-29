// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hit_effect_par(_spr,_dir,_color1,_color2,_life1,_life2, _burst){
	var instance_effect = instance_create_depth(x,y,depth,obj_particle);
	
	instance_effect.set_size(0.05,0.1);
	instance_effect.set_sprite(_spr,false,false,true);
	instance_effect.set_orientation(0,360);
	if _color1 	instance_effect.set_color_mix(_color1,_color2);
	instance_effect.set_alpha(random_range(0.6,1),0);
	instance_effect.set_direction(_dir,_dir);
	instance_effect.set_speed(5,10,-1);
	instance_effect.set_life(_life1,_life2);
	instance_effect.set_timer(120);
	instance_effect.burst(_burst);
}