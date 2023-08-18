///player_check_crush()

// Used by moving solids.

if distance_to_object(Player) < speed + 4 {
    with(Player) {
        if !place_free(x, y) {
            player_kill();
        }
    }
}
