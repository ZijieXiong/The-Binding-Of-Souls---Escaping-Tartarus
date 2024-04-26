/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_label);
//draw_text(x, (y-20), "Shield");
draw_text_transformed(x,(y-15), "Shield",0.5,0.5,image_angle);