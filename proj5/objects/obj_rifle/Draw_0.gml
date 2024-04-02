
draw_self()
if(pressed){
var _charge_precent = ((increase_damage/max_damage_increase)*100)
draw_healthbar(x-15,y+10,x+15,y+15,_charge_precent,c_black,c_lime,c_red,0,false,false)
}

