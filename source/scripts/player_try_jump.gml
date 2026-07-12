///player_try_jump()

if on_floor || !place_free(x, y + global.grav) || place_meeting(x, y, Platform) || place_meeting(x, y, WaterGroundJump) {
    player_ground_jump();
}
else if air_jumps > 0 || place_meeting(x, y, Water) || global.debug_infinite_jump {
    player_air_jump();
}
