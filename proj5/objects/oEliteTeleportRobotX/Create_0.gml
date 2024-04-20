/// @description Insert description here
// You can write your code in this editor
event_inherited();



size_scale = 1.5;

shoot_target_x = 0;
shoot_target_y = 0;

teleport_radialBuffer = 20;



b_tree = new BTreeRoot(id);


// --- 
var _selector_root = new BTreeSelector();
var _sequence_chase = new BTreeSequence();
var _chase_in_range = new TaskInstanceInRange(obj_player, 500);
//var _chase_behave = new TaskChaseInstance(obj_player, 1.8, 400, 250);

var _chase_behave = new TaskChaseInstanceNoPathfind(obj_player, 1.8, 400, 250);
var _succeder = new BTreeSucceeder();
var _spell_1 = new TaskSpell1(obj_player, 0.2*60);



//var _spell_2 = new TaskSpell2(obj_player, 1*60);
//var _check_spell_2 = new TaskCheckSpell(obj_player, 4 );
//var _sequence_spell_2 = new BTreeSequence();
//var _check_spell_tornado = new TaskCheckSpell(obj_player, 6);
//var _spell_tornado = new TaskSpellTornado(obj_player, 1*60);
//var _sequence_spell_3 = new BTreeSequence();

var _selector_spell = new BTreeSelector();

b_tree.ChildAdd(_selector_root);

//_sequence_spell_3.ChildAdd(_check_spell_tornado);
//_sequence_spell_3.ChildAdd(_spell_tornado);

//_sequence_spell_2.ChildAdd(_check_spell_2);
//_sequence_spell_2.ChildAdd(_spell_2);

var _sequence_laser = new BTreeSequence();
var _check_laser = new TaskCheckSpell(obj_player, 10);
//var _load_laser = new TaskLoadLaser(obj_player, 1*60);
var _shoot_laser = new TaskShootLaser(obj_player, 1*60, 5*60, 2, 0.2);

_sequence_laser.ChildAdd(_check_laser);
//_sequence_laser.ChildAdd(_load_laser);
_sequence_laser.ChildAdd(_shoot_laser);

var _sequence_missile = new BTreeSequence();
var _check_missile = new TaskCheckSpell(obj_player, 3);
//var _load_laser = new TaskLoadLaser(obj_player, 1*60);
var _launch_missile = new TaskLaunchMissile(1, 1*60);

_sequence_missile.ChildAdd(_check_missile);
_sequence_missile.ChildAdd(_launch_missile);


var _sequence_teleport = new BTreeSequence();
var _check_teleport = new TaskCheckSpell(obj_player, 10);
//var _load_laser = new TaskLoadLaser(obj_player, 1*60);
var _teleport = new TaskTeleport(1.5*60);

_sequence_teleport.ChildAdd(_check_teleport);
_sequence_teleport.ChildAdd(_teleport);



//_selector_spell.ChildAdd(_sequence_spell_3);
//_selector_spell.ChildAdd(_sequence_spell_2);
_selector_spell.ChildAdd(_sequence_teleport);
_selector_spell.ChildAdd(_sequence_laser);
_selector_spell.ChildAdd(_sequence_missile);
//_selector_spell.ChildAdd(_spell_1);

_sequence_chase.ChildAdd(_chase_in_range);
_sequence_chase.ChildAdd(_chase_behave);
//_sequence_chase.ChildAdd(_succeder);
//_succeder.ChildAdd(_hit);
_sequence_chase.ChildAdd(_selector_spell);

_selector_root.ChildAdd(_sequence_chase);
//_selector_root.ChildAdd(_patrol);


b_tree.Init();


enum TELE_STATE {
    IDLE,
    WALK,
	SHOOT,
	LASER,
	TELE
}

// Initial state
current_state = TELE_STATE.IDLE;

//_current_room = ds_list_find_value(oDungeon.roomList, 0);

launch_missile = function ()
{
		var _height = 600;
		var _speed = 5;
		var _time = _height/_speed;
		
		//var _x = random_range(_current_room.x1 * CELL_SIZE,_current_room.x2 * CELL_SIZE);
		//var _y = random_range(_current_room.y1 * CELL_SIZE,_current_room.y2 * CELL_SIZE);
		
		var _x = random_range(_currentRoom.x1 * CELL_SIZE,_currentRoom.x2 * CELL_SIZE)
		var _y = random_range(_currentRoom.y1 * CELL_SIZE,_currentRoom.y2 * CELL_SIZE)
	
		
		var bomb_radius = 200;
		//var _x = x  + random_range(-bomb_radius, bomb_radius);
		//var _y = y + random_range(-bomb_radius, bomb_radius);
		//var _y = random_range(_current_room.y1 * CELL_SIZE,_current_room.y2 * CELL_SIZE);
		
		var _o_target = instance_create_layer(_x, _y, "Instances", oRobotMissileTarget);
		var _o_missile =  instance_create_layer(_x, _y - _height, "Instances", oRobotMissile);
		_o_missile.direction = point_direction(_x,  _y-_height, _x,_y );
		_o_missile.speed = 5;
		_o_missile.target_x = _x;
		_o_missile.target_y = _y;
		//_o_missile.obj_target = _o_target;
		_o_missile.alarm[0] = _time;
		_o_target.alarm[0] = _time;
		
}


get_new_location = function()
{
	var _x = 0;
	var _y = 0;
	
	do {
		_x = random_range(_currentRoom.x1 * CELL_SIZE,_currentRoom.x2 * CELL_SIZE)
		_y = random_range(_currentRoom.y1 * CELL_SIZE,_currentRoom.y2 * CELL_SIZE)
		
		var col_info = collision_circle(_x, _y, teleport_radialBuffer, [obj_wall],true,0);
		
	
	} until (col_info==noone) ;
	return [_x, _y];
}

teleport_to_ = function(_x, _y)
{
	x = _x;
	y = _y;
}

create_tele_effect = function(_x, _y)
{
	var tel_out = instance_create_layer(x,y,"Instances",obj_teleport_out);
	tel_out.target_x = _x;
	tel_out.target_y = _y;
}
