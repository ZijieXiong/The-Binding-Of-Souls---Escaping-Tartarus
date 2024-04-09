/// @description Insert description here
// You can write your code in this editor
image_xscale = 0.5;
image_yscale = 0.5;


enum FRAIL_STATE {
    IDLE,
    FIRST_WALK,
	SECOND_WALK,
    BOUNCE,
}

current_state = FRAIL_STATE.IDLE;

start_x = 0;
start_y = 0;
target_x = 0;
target_y = 0;

first_walk_time = 2 * 60;
second_walk_time = 1 * 60;

state_end_flag = false;

alpha = 0;
count = 0;

speed = 0;

begin_first_walk = function(_sx, _sy, _tx, _ty)
{
		start_x = _sx;
		start_y = _sy;
		target_x = _tx;
		target_y = _ty;
		
		count = 0;
		current_state = FRAIL_STATE.FIRST_WALK;
}

begin_second_walk = function(_sx, _sy, _tx, _ty)
{
		start_x = _sx;
		start_y = _sy;
		target_x = _tx;
		target_y = _ty;
		
		count = 0;
		current_state = FRAIL_STATE.SECOND_WALK;
}
