///player_check_crush()

if place_meeting(x + hspeed, y + vspeed, Player) {
    with(Player) {
        if !place_free(x, y) {
            player_kill();
        }
    }
}
