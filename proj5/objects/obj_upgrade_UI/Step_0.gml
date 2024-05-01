/// @description Insert description here
// You can write your code in this editor
hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
if (hovering && mouse_check_button_pressed(mb_left)) 
{
	clicked = true;
} 

if (mouse_check_button_released(mb_left)) 
{
	clicked = false;

	if (hovering) 
	{
		show_debug_message("clicked");
		if (parentUpgrade != noone) {
			global.playerFreeze = false;
			show_debug_message("upgrade");
		    with (parentUpgrade) {
		        applyUpgrade();
		    }
			
			with(obj_upgrade_UI)
			{
			    instance_destroy();
			}
		}
	}
	
} 