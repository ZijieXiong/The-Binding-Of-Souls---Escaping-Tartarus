/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fnt_ui_medium);

var screen_x = display_get_gui_width() / 2;
var screen_y = display_get_gui_height() / 4;
draw_text(screen_x, screen_y, message);

draw_set_alpha(1);