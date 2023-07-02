///event_world_step()

if keyboard_check_pressed(vk_escape) {
    game_end();
}

if keyboard_check_pressed(vk_f4) {
    config_set("fullscreen", !config_get("fullscreen"));
    window_set_fullscreen(config_get("fullscreen"));

    config_write();
}
