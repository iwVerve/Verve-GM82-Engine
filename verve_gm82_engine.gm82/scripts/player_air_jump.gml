///player_air_jump()

vspeed = -global.grav * air_jump_speed;
air_jumps -= 1;
sound_play("player_air_jump");
