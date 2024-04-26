/// @description Insert description here
// You can write your code in this editor
price = 15;
text = "";
button = instance_create_layer(x,y+50,"Instances", obj_shop_upgrade_button);
button.parent = self;

function upgrade()
{
	show_debug_message("shop upgrade");
}

function upgrade_fail()
{
	show_debug_message("upgrade fail");
}