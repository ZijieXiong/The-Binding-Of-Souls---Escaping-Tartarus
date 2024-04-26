/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


draw_rectangle(
_currentRoom.x1 * CELL_SIZE,
(_currentRoom.y1+1) * CELL_SIZE,
(_currentRoom.x2+1) * CELL_SIZE,
(_currentRoom.y2+1) * CELL_SIZE,
true);
