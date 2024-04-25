if !place_meeting(x-dcos(point_direction(x, y, other.x, other.y)),y+dsin(point_direction(x, y, other.x, other.y)),[obj_wall]){
x -= dcos(point_direction(x, y, other.x, other.y))
y += dsin(point_direction(x, y, other.x, other.y))
}
