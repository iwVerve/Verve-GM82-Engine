///player_flip([target])

// If no target gravity is provided, always flips.
// Otherwise, only flips to the specific gravity (1 or -1).

if argument_count > 0 if argument[0] == global.grav {
    exit;
}

global.grav *= -1;

with(Player) {
    air_jumps = max_air_jumps;
    vspeed = 0;
    gravity = global.grav * grav;

    player_set_mask();
    y += 4 * global.grav;
}
