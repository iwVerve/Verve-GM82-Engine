///player_release_jump()

if global.grav * vspeed < 0 {
    vspeed *= jump_release_multiplier;
}
