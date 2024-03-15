

pistol_cooldown = 0
interval = 1

/*
weapons[0] = ds_map_create();
ds_map_add(weapons[0],"sprite",test_gun);
ds_map_add(weapons[0],"recoil",0);
ds_map_add(weapons[0],"recoil_push",0);
ds_map_add(weapons[0],"damage",1);
ds_map_add(weapons[0],"projectile",obj_pistol_bullet);
ds_map_add(weapons[0],"startup",0);
ds_map_add(weapons[0],"length",24);
ds_map_add(weapons[0],"cooldown",room_speed * 1);
ds_map_add(weapons[0],"bulletspeed",13);
ds_map_add(weapons[0],"automatic",false);
ds_map_add(weapons[0],"bulletcount",1);
ds_map_add(weapons[0],"name","pistol");

//shotgun
weapons[1] = ds_map_create();
ds_map_add(weapons[1],"sprite",test_gun);
ds_map_add(weapons[1],"recoil",3);
ds_map_add(weapons[1],"recoil_push",0);
ds_map_add(weapons[1],"damage",1);
ds_map_add(weapons[1],"projectile",obj_shotgun_bullet);
ds_map_add(weapons[1],"startup",0);
ds_map_add(weapons[1],"length",24);
ds_map_add(weapons[1],"cooldown",room_speed * 1);
ds_map_add(weapons[1],"bulletspeed",13);
ds_map_add(weapons[1],"automatic",false);
ds_map_add(weapons[1],"bulletcount",3);
ds_map_add(weapons[1],"name","shotgun");

//Rifle
weapons[2] = ds_map_create();
ds_map_add(weapons[2],"sprite",test_gun_2);
ds_map_add(weapons[2],"recoil",6);
ds_map_add(weapons[2],"recoil_push",2);
ds_map_add(weapons[2],"damage",3);
ds_map_add(weapons[2],"projectile",obj_rifle_bullet);
ds_map_add(weapons[2],"startup",0);
ds_map_add(weapons[2],"length",24);
ds_map_add(weapons[2],"cooldown",room_speed * 0.1);
ds_map_add(weapons[2],"bulletspeed",16);
ds_map_add(weapons[2],"automatic",true);
ds_map_add(weapons[2],"bulletcount",1);
ds_map_add(weapons[2],"name","rifle");


//Laser
weapons[3] = ds_map_create();
ds_map_add(weapons[3],"sprite",test_gun_2);
ds_map_add(weapons[3],"recoil",6);
ds_map_add(weapons[3],"recoil_push",0);
ds_map_add(weapons[3],"damage",5);
ds_map_add(weapons[3],"projectile",obj_laser_beam);
ds_map_add(weapons[3],"startup",0);
ds_map_add(weapons[3],"length",24);
ds_map_add(weapons[3],"cooldown",10);
ds_map_add(weapons[3],"bulletspeed",7);
ds_map_add(weapons[3],"automatic",true);
ds_map_add(weapons[3],"bulletcount",1);
ds_map_add(weapons[2],"name","laser");

function ChangeWeapon(argument0) {
	weapon = argument0;
	var wp_map = weapons[weapon];
	sprite = ds_map_find_value(wp_map,"sprite");
	recoil = wp_map[? "recoil"];
	recoil_push = wp_map[? "recoil_push"];
	damage = wp_map[? "damage"]; 
	projectile = wp_map[? "projectile"]; 
	startup = wp_map[? "startup"]; 
	bulletspeed = wp_map[? "bulletspeed"]; 
	length = wp_map[? "length"]; 
	cooldown = wp_map[? "cooldown"]; 
	automatic = wp_map[? "automatic"]; 
	bulletcount = wp_map[? "bulletcount"];
	name = wp_map[? "name"];


}
ChangeWeapon(0)

current_cd = 0;
current_delay = -1;
current_recoil = 0;