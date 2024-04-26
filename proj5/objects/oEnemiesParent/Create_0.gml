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

function hit_effect(_x,_y,_dmg){
	
	if global.currLevel >= 7{
		var _hit = instance_create_layer(_x,_y, "Instances",oElectrictHit);
		_hit._enemy = self
		_hit._xDiff  = self.x - _x
		_hit._yDiff = self.y - _y
	}

	/*
	var _ptype1 = part_type_create();
	part_type_sprite(_ptype1, spr_self_electricity, false, 0, 0);
	part_type_size( _ptype1, 0.5, 0.5, 0, 0 );
	var enemy_size = sprite_get_width(sprite_index) * image_xscale
	var par_size = sprite_get_width(spr_self_electricity)
	var _scale =   enemy_size / par_size
	part_type_scale( _ptype1, _scale,_scale);
	part_type_speed( _ptype1, 0, 0, 0, 0);
	part_type_direction( _ptype1, 0, 0, 0, 0);
	part_type_gravity( _ptype1, 0, 270);
	part_type_orientation( _ptype1, 0, 360, 0, 0, false);
	part_type_colour3( _ptype1, $FFCE0A ,$55FF00  , $55FF00 );
	part_type_alpha3( _ptype1, 1, 1, 1);
	part_type_blend( _ptype1, false);
	part_type_life( _ptype1, 30, 30);
	part_particles_create(P_System,x,y,_ptype1,1)
	*/
	//part_emitter_region(P_System, 0,  x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
	//part_system_destroy(P_System);
}