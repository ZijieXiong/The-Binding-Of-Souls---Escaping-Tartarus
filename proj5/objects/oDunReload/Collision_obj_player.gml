dm.richochetProb += 0.05;
instance_destroy(obj_minimap_draw)

/*if (instance_number(oTracker) <= 0 && instance_number(oTurret) <= 0
	&& instance_number(oTrackShooter) <= 0) {
	*/
	instance_create_layer(x,y,"Instances", obj_blackout);
	//if ((dm.currLevel + 1) mod 5 == 0) {
	//	room_goto(rmGetUpgrade);
	//}
	
	//else {
		instance_destroy();
	//}
//}