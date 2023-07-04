///player_try_jump()

if on_floor || place_meeting(x, y, Platform) {
    player_ground_jump();
}
else if air_jumps > 0 {
    player_air_jump();
}
