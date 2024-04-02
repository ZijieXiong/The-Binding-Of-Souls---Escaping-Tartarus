/// @description Insert description here
// You can write your code in this editor
if(global.shotgunBlockAttack)
{
	if(!global.shotgunBlockPenetrate)
	{
		instance_destroy();
	}
	with(other){
		instance_destroy();
	}
}