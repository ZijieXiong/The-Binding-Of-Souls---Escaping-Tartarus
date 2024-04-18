/// @description Insert description here
// This is from https://gamemaker.io/en/tutorials/coffee-break-tutorials-juicy-screenshake-gml
is_poisoned = false;
poison_time = 0;
poison_magnitude = 0;
poison_fade = 0.2;

hue_lay_id = layer_get_id("Poison_Effect");
hue_fx = layer_get_fx("Poison_Effect");
hue_fx_param = fx_get_parameter(hue_fx,"Poison_Effect" );
layer_set_visible(hue_lay_id, false);

hue_count = 0;
hue_T = 10*60;

distort_lay_id = layer_get_id("Poison_Distort_Effect");
distort_fx = layer_get_fx("Poison_Distort_Effect");

fx_set_parameter(distort_fx, "g_DistortScale",10);
layer_set_visible(distort_lay_id, false);