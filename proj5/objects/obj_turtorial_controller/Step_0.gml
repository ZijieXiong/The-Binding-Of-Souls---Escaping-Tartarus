if( instance_number(oSlime_tur) == 0) {
    global.tutorial_started_1=false;
}

if (instance_number(oSlime_tur2) == 0) {
    global.tutorial_started_2=false;
}

if(( instance_number(oSlime_tur) == 0)&&(instance_number(oSlime_tur2) == 0)){
	global.turtorial_finished=true;
	room_goto(rmTutorial);
}