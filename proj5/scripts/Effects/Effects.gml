// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


/// @function                   screenshake(_time, _magnitude, _fade);
/// @param  {real}  _time       The length of time - in steps - to shake the screen
/// @param  {real}  _magnitude  The amount of screenshake to apply
/// @param  {real}  _fade       How quickly the screenshake effect will fade out
/// @description    Set the screenshake object variables.

function screenshake(_time, _magnitude, _fade)
{
   with (obj_camera)
   {
      shake = true;
      shake_time = _time;
      shake_magnitude = _magnitude;
      shake_fade = _fade;
   }
}

function get_poisoned(_time, _magnitude, _fade)
{
	show_debug_message("Get poisoned!");
	with (obj_screenpoison)
	{
		is_poisoned = true;
		poison_time = _time;
		poison_magnitude = _magnitude;
		poison_fade = _fade;
	}
}