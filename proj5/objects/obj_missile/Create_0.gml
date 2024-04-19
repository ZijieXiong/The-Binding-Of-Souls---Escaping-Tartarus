self.image_xscale = 0.5;
self.image_yscale = 0.5;

_damage = 120
_speed = 12
closest_enemy = noone
closest_enemy = instance_nearest(obj_player.x,obj_player.y,oEnemiesParent)
hitEnemies = ds_list_create()

_setDir = false