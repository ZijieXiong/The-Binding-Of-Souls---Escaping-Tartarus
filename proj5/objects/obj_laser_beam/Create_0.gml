xEnd = 0;     // breakpoints
yEnd = 0;
length_laser = 0; // total length used to determine and draw laser

damage = 5;
bouncesLeft = 0;
timer = room_speed * 3


// change here to change color and glow type
color = 1;  //  0 blue, 1 orange, 2 violet, 3 pink, 4 red, 5 green
whatImage  =  spr_laser_beam;  // spr_Laser_Hard_glow_38px   or   spr_Laser_Soft_glow_38px   or   spr_Laser_No_glow_38px




// change here to ajust to your needs for "refresh" rate of laser collision check
// memory space saver, less checks per step
refresh_hit = false;
refresh_hit_time = 20;  // 3 times per second
refresh_hit_timer = refresh_hit_time;