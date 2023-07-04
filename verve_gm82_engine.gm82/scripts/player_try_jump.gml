///player_try_jump()

if on_floor {
    player_ground_jump();
}
else if air_jumps > 0 {
    player_air_jump();
}
