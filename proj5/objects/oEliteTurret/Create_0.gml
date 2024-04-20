event_inherited();
attack_cooldown = 0;

bulletSpiralCount = 18; // Amount of bullets to be spawned
bulletSpiralIterator = 0; // Iterator used for spawning bullets
bulletSpiralInterval = max(2, 13 - global.currLevel); // Spawn 4 bullets/sec
bulletSpiralSpeed = 2.5  + 0.2 * global.currLevel;; // Speed of the bullet
initial_direction = 0;
self.image_xscale = 2;
self.image_yscale = 2;

direct_cooldown = 0;
bulletDirectInterval = max(12, 30 - global.currLevel);

dm = instance_find(oDungeon, 0);

playerInRange = false;


last_sprite = sprite_index