_health = 50 + (global.currLevel -1) * 10;
_flash = 0
invincible = false
_currentRoom = noone
path = path_add()

item_prob = 50;

item_types = [oShieldPicker];
P_System=part_system_create();
_moveSpeed = 0

function dropItem()
{
	if(random(100) <= 50)
	{
		var item_ind = irandom(array_length(item_types) - 1);
		instance_create_layer(x,y,"Instances",item_types[item_ind]);
		audio_play_sound(itemDrop, 0, false);
	}
}

get_random_point_in_room = function()
{
	var _x = random_range(_currentRoom.x1 * CELL_SIZE,(_currentRoom.x2+1) * CELL_SIZE);
	var _y = random_range((_currentRoom.y1+1) * CELL_SIZE,(_currentRoom.y2+1) * CELL_SIZE);
	return [_x, _y];
}

is_in_room = function(_x, _y)
{
	var _bX = (_currentRoom.x1 * CELL_SIZE<= _x) && (_x <=(_currentRoom.x2+1) * CELL_SIZE);
	var _bY = ((_currentRoom.y1+1) * CELL_SIZE<= _y) &&  (_y<=(_currentRoom.y2+1) * CELL_SIZE);
	return _bX && _bY;
}

function hit_effect(_x,_y,_dmg,_dir){
	
	if global.currLevel >=1 and global.currLevel <=3 {
		hit_effect_par(spr_blood,_dir,c_red,make_color_rgb(128,0,0),150,180,10)
	}else if global.currLevel >=4 and global.currLevel <=6{
		show_debug_message("smoke")
		hit_effect_par(spr_smoke_hit,_dir,make_color_rgb(158,136,98),make_color_rgb(158,136,98),50,90,20)
	}
	else if global.currLevel >= 7 and global.currLevel <= 9{
		var _hit = instance_create_layer(_x,_y, "Instances",oElectrictHit);
		_hit._enemy = self
		_hit._xDiff  = self.x - _x
		_hit._yDiff = self.y - _y
		_hit.image_angle = _dir
	}

}