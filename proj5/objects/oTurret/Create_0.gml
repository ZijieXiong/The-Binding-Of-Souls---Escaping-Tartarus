event_inherited();
attack_cooldown = 0;
turretLives = 3;

bulletSpiralCount = 18; // Amount of bullets to be spawned
bulletSpiralIterator = 0; // Iterator used for spawning bullets
bulletSpiralInterval = max(2, 12 - global.currLevel div 2); // Spawn 4 bullets/sec
bulletSpiralSpeed = 2.5  + 0.2 * global.currLevel;; // Speed of the bullet
bulletSpiralClockwise = choose(-1,1);
initial_direction = 0;
self.image_xscale = 2;
self.image_yscale = 2;

_health = 50 + global.currLevel * 10;

dm = instance_find(oDungeon, 0);

last_sprite = sprite_index