/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_ui_large);
draw_set_color(c_white);

draw_text(480, 250, "Game Over...");

draw_sprite_ext(spr_player_death, 3, 480, 450, 5, 5, 0, -1, 1);

draw_set_font(fnt_ui_medium);
draw_text(480, 550, "Press Space Key to Restart.")