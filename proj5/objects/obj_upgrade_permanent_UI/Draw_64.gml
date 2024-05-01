/// @description Insert description here
// You can write your code in this editor
var screen_width = display_get_gui_width();

var start_x = screen_width;
var _y = 200;
var step = 20;

draw_set_font(fnt_label);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_sprite_ext(soul,0,start_x - 60,_y - 20,1,1,0,c_white,1)
draw_text(start_x, _y - 20, string(global.soul));

draw_text(start_x, _y, "Upgrades");
_y += step;

var key, value;
var map_keys = ds_map_keys_to_array(global.upgrade_permanent_accum);
for (var i = 0; i < array_length(map_keys); i++) {
    key = map_keys[i];
    value = ds_map_find_value(global.upgrade_permanent_accum, key);
    draw_text(start_x, _y, string(key) + string(value));
    _y += step;
}

for (var i = 0; i < ds_list_size(global.upgrade_permanent_once); i++) {
    var upgrade = ds_list_find_value(global.upgrade_permanent_once, i);
    draw_text(start_x, _y, upgrade);
    _y += step;
}