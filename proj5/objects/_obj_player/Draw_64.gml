for (i = 0; i < playerLives; i++) {
  draw_sprite(heart, 0, i*64 + 10, 10);
}

for (i = 0; i < global.revive; i++) {
	draw_sprite(spr_revive, 0, i*64 + 40, 120);
}

//draw_text(150,100,"Revive: " + string(global.revive));
//draw_text(150, 100, "canBomb: " + string(canBomb));
//draw_text(150, 174, "Meter: " + string(grazeMeter));