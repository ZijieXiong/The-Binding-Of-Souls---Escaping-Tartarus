/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_red);

// 绘制一条从怪物位置到激光当前位置的线
if(owner_id)
{
	draw_line(owner_id.x, owner_id.y, x, y);
}


// 重置绘制颜色
draw_set_color(c_white);