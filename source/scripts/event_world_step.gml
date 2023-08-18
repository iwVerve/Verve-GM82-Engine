///event_world_step()

// Called from the World object.
var _pause_surf;

game_hotkeys();

if is_in_game() && !global.paused {
    if (!global.time_when_dead || instance_exists(Player)) && (global.time_when_clear || !save_get("clear")) {
        save_set_persistent("time", save_get("time") + 1 / room_speed);
    }

    debug_hotkeys();
}

update_window_caption();
render_update();
