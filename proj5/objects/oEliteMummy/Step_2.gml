/// @description Animator
// You can write your code in this editor
var x_movement = x-xprevious;
var y_movement = y-yprevious;

if(x_movement < 0)
{
	image_xscale = -size_scale;
	image_yscale = size_scale;
}

if(x_movement > 0)
{
	image_xscale = size_scale;
	image_yscale = size_scale;
}

switch (current_state) {
    case LORD_STATE.IDLE:
        //Idle
		if(x_movement != 0 || y_movement != 0)
		{
			current_state = LORD_STATE.WALK;
			sprite_index = spr_mummy_lord_walk;
		}
		break;
		
	case LORD_STATE.WALK:
		if(x_movement == 0 && y_movement  == 0)
		{
			current_state = LORD_STATE.IDLE;
			sprite_index = spr_mummy_lord_idle;
		}
		break;
		
	case LORD_STATE.CAST:
		
		break;
}
