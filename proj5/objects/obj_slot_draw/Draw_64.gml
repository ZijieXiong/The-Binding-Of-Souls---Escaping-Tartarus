/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i<global.max_items; i+=1){
	draw_sprite_ext(spr_slot_ui, 0, x+i*16*8, y, 4, 4, 0, -2, 1);
	if(global.spr_inventory[i] != -1){
		draw_sprite(global.spr_inventory[i],0,x+i*16*8,y)
	}
}
