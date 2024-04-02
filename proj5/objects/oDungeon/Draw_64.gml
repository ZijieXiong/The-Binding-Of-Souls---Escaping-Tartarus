draw_set_font(HighScore);
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(display_get_gui_width()-20, 20, "Current Level: " + string(global.currLevel));