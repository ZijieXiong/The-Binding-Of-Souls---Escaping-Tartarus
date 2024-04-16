/// @description Insert description here
// You can write your code in this editor
if (instance_exists(enemy)) {
    var current_health = enemy._health;
    //var max_health = max_health;
    var bar_width = 200;
    var bar_height = 20;
    var x_pos = (display_get_gui_width() - bar_width) / 2;
    var y_pos = 20;

    draw_set_color(c_white);
    draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, true);
    
    var health_width = (current_health / max_health) * bar_width;
    draw_set_color(c_red);
    draw_rectangle(x_pos, y_pos, x_pos + health_width, y_pos + bar_height, false);
    
    draw_set_color(c_white);
}
else {
    instance_destroy();
}