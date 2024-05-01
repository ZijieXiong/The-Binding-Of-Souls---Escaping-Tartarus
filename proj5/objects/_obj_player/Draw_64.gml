var _lives = 0
var revive_offset = 0
for (i = 0; i < playerLives; i++) {
  var x_offset = i % 5
  var y_offset = floor(i / 5)
  draw_sprite(spr_full_health, 0, x_offset*64 + 10, y_offset*64 + 10);
  _lives = i +1

}

for (i = _lives; i < healthLimit; i++){
	  var x_offset = i % 5
	  var y_offset = floor(i / 5)
	  draw_sprite(spr_no_health, 0, x_offset*64 + 10, y_offset*64 + 10);
}

for (i = 0; i < global.revive; i++) {
	revive_offset = ceil(healthLimit / 5) + 1
	draw_sprite(spr_revive, 0, i*64 + 40, revive_offset*64 );
}
//draw_text(150,100,"Revive: " + string(global.revive));
//draw_text(150, 100, "canBomb: " + string(canBomb));
//draw_text(150, 174, "Meter: " + string(grazeMeter));