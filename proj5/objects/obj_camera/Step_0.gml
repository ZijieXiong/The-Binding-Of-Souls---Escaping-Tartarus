/// @description Insert description here
// You can write your code in this editor

var cam, playerX, playerY, viewW, viewH;
var camX = 0;
var camY = 0;


player_viewW = 8*60;
player_viewH = 8*60;

global_viewW = 2048;
global_viewH = 2048;

window_set_size(player_viewW, player_viewH);


cam = view_camera[0];

if(keyboard_check_pressed(ord("O"))){
	camera_mode = 1 - camera_mode;
	
	canToggleCameraMode = false;
	show_debug_message("Camera Mode: " + string(camera_mode) + ", Can Toggle: " + string(canToggleCameraMode));
}
else if(!keyboard_check(ord("O"))){
	canToggleCameraMode = true;
}


if(camera_mode == 0)
{
	playerX = _obj_player.x;
	playerY = _obj_player.y;
	camX = playerX - player_viewW / 2;
	camY = playerY - player_viewH / 2;
	camera_set_view_pos(cam, camX, camY);

	camera_set_view_size(cam, player_viewW, player_viewH);
}
else
{
	camX = 0;
	camY = 0;
	camera_set_view_pos(cam, 0, 0);
    camera_set_view_size(cam, global_viewW, global_viewH);
}


if (shake) 
{ 
   shake_time -= 1; 
   var _xval = camX + choose(-shake_magnitude, shake_magnitude); 
   var _yval = camY + choose(-shake_magnitude, shake_magnitude); 
   camera_set_view_pos(view_camera[0], _xval, _yval); 

   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
         camera_set_view_pos(view_camera[0], camX, camY); 
         shake = false; 
      } 
   } 
}
window_set_size(960,960);



