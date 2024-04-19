/// @description Insert description here
// You can write your code in this editor
switch(state){
	case "fading_in":
		alpha += fade_speed;
		if(alpha >= 1){
			alpha = 1;
			state = "displaying";
		}
		break;
	case "displaying":
		timer++;
		if(timer >= show_duration){
			state = "fading_out";
		}
		break;
	case "fading_out":
		alpha -= fade_speed;
		if(alpha <= 0){
			alpha = 0;
			instance_destroy();
		}
		break;
}