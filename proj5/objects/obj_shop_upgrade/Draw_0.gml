/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fnt_label);
draw_set_halign(fa_center);
draw_sprite_ext(soul,0,x - 40,y+40,1,1,0,c_white,1)
draw_text(x,y+40,string(price));
draw_text(x,y-50,text);