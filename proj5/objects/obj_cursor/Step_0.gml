/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_f1)) // vk_f1 can be replaced with any desired key
{
    // Toggle between fullscreen and windowed mode
    window_set_fullscreen(!window_get_fullscreen());
}