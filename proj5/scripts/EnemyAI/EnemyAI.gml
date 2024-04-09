// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function look_at_player(_enemy_obj, _player_obj, _reverse_flag=false)
{
	var _turn = 1;
	if(_enemy_obj.x - _player_obj.x > 0)
	{
		_turn *= -1;
	}
	if(_reverse_flag)
	{
		_turn *= -1;
	}
	_enemy_obj.image_xscale = _turn;
	_enemy_obj.image_yscale = 1;
}