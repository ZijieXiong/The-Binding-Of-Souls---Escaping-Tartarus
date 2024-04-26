_enemy = noone
_xDiff = 0
_yDiff = 0
image_xscale = 0.5
image_xscale = 0.5


image_blend = c_yellow

alarm[0] = room_speed * 0.5

/*
if _enemy{
draw_sprite_ext(sprite_index,image_index,x,y,_image_scale,_image_scale,0,c_yellow,0)
}

if instance_exists(_enemy) {
	
	_enemy_size = sprite_get_width(_enemy.sprite_index) * _enemy.image_xscale
	_self_sprite = sprite_get_width(spr_self_electricity)
	_image_scale = _self_sprite/ _enemy_size 
	show_debug_message(_image_scale)

	_xDiff = _enemy.x - x
	_yDiff = _enemy.y - y
}

