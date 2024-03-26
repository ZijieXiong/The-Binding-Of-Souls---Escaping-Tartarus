/// @description Insert description here
// You can write your code in this editor
if (growing) {
    scale += 0.05;
	if(scale >= 0.7){
		growing = false;
	}
}

else if (scale > 0.1) {
    scale -= 0.02;
}

else {
    instance_destroy();
    exit;
}

alarm[0] = 1;