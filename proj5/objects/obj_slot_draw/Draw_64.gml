/// @description Insert description here
// You can write your code in this editor

var slot_width = sprite_get_width(spr_slot_ui_gai) / 2;
var scale_first = 4;
var scale_other = 2;
var spacing = 50;

var first_slot_width = slot_width * scale_first;

var other_slot_width = slot_width * scale_other;

var current_x = x;

for (var i = 0; i < global.max_items; i += 1) {
	var temp_x = current_x
    if (i == 0) {
        draw_sprite_ext(spr_slot_ui_gai, 0, current_x, y, scale_first, scale_first, 0, -2, 1);
        current_x += first_slot_width + spacing;
    } else {
        draw_sprite_ext(spr_slot_ui_gai, 0, current_x, y, scale_other, scale_other, 0, -2, 1);
        current_x += other_slot_width + spacing;
    }
	
	if (global.spr_inventory[i] != -1) {
        var item_x = (i == 0) ? (x + first_slot_width - slot_width * scale_other) : current_x - other_slot_width - spacing;
        draw_sprite(global.spr_inventory[i], 0, temp_x, y);
    }


}