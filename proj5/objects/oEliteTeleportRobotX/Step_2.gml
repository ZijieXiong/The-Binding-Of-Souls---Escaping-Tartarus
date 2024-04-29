/// @description Animator
// You can write your code in this editor
var x_movement = x-xprevious;
var y_movement = y-yprevious;

if(obj_player_main.x < x)
{
	image_xscale = -size_scale;
	image_yscale = size_scale;
}

if(obj_player_main.x > x)
{
	image_xscale = size_scale;
	image_yscale = size_scale;
}

switch (current_state) {
    case TELE_STATE.IDLE:
        //Idle
		if(x_movement != 0 || y_movement != 0)
		{
			current_state = TELE_STATE.WALK;
			sprite_index = spr_teleport_idle;
		}
		break;
		
	case TELE_STATE.WALK:
		if(x_movement == 0 && y_movement  == 0)
		{
			current_state = TELE_STATE.IDLE;
			sprite_index = spr_teleport_idle;
		}
		break;
		
	case TELE_STATE.LASER:
		break;
	
	case TELE_STATE.TELE:
		break;
}
		
		
