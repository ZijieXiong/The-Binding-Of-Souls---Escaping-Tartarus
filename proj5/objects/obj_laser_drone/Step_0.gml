

direction = point_direction(_obj_player.x,_obj_player.y,mouse_x,mouse_y);

x = _obj_player.x + lengthdir_x(20,direction+90)
y = _obj_player.y + lengthdir_y(20,direction+90)

image_angle = direction

//if mouse_check_button_pressed(mb_left){
	if instance_exists(oEnemiesParent){
		var furest_enemy = instance_furthest(x,y,oEnemiesParent)
		if !instance_exists(oLaser){
			laser = instance_create_layer(furest_enemy.x,furest_enemy.y,"Instances",oLaser)
		}
		if instance_exists(laser){
			laser.image_angle = point_direction(x,y,furest_enemy.x,furest_enemy.y)
			laser._enemy = furest_enemy
		}
	}else{
		instance_destroy(laser)
	}

//}
/*
if mouse_check_button_released(mb_left){
	instance_destroy(oLaser)
}