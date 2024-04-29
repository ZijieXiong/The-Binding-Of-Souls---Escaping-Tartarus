if (point_distance(obj_player_main.x, obj_player_main.y, x, y) < ENEM_DISTANCE) {
    var dir = point_direction(x, y, obj_player_main.x, obj_player_main.y);
    var newX = x + lengthdir_x(speed, dir);
    var newY = y + lengthdir_y(speed, dir);
    if (!place_meeting(newX, newY, obj_wall)) {
        move_towards_point(obj_player_main.x, obj_player_main.y, speed);
    } else {
        speed = 0;
    }
}