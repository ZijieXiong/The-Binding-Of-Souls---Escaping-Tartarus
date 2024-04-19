/// @description Insert description here
// You can write your code in this editor
event_inherited();
enum States{ Idle, Attack}

state = States.Idle;
attack_interval = 120;
attack_timer = attack_interval;

left_hand = instance_create_layer(x-32, y, "Instances", oEliteMummyHand);

right_hand = instance_create_layer(x+32, y, "Instances", oEliteMummyHand);
right_hand.is_left_hand = false;

left_hand.owner_id = self;
right_hand.owner_id = self;

laser = instance_create_layer(x,y+sprite_height/2, "Instances", oEliteMummyLaser);
laser.owner_id = self;

hand_speed = 0.5;

sprite_index = spr_elite_mummy_idle;