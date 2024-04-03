/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_sprite(spr_upgrade_general, 0, x, y);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_sprite(upgradeIcon, 0, x, y);
//draw_text(x, y, upgradeName);

draw_set_font(fnt_upgrade_ui);
draw_text(x, y + 50, upgradeDescription);