attack_cooldown = 0;
turretLives = 3;

bulletSpiralCount = 18; // Amount of bullets to be spawned
bulletSpiralIterator = 0; // Iterator used for spawning bullets
bulletSpiralInterval = 6; // Spawn 4 bullets/sec
bulletSpiralSpeed = 2; // Speed of the bullet

self.image_xscale = 2;
self.image_yscale = 2;

_health = 50;

dm = instance_find(oDungeon, 0);