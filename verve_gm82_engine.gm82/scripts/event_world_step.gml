///event_world_step()

// Close game
if keyboard_check_pressed(vk_escape) || global.close_button_pressed {
    if room == rTitle {
        game_end();
    }
    else {
        room_goto(rTitle);
        global.close_button_pressed = false;
    }
}

// Restart game
if keyboard_check_pressed(vk_f2) {
    room_goto(rTitle);
}

// Fullscreen
if keyboard_check_pressed(vk_f4) || (keyboard_check(vk_alt) && keyboard_check_pressed(vk_return)) {
    config_set("fullscreen", !config_get("fullscreen"));
    window_set_fullscreen(config_get("fullscreen"));

    config_write();
}

// Reset window
if keyboard_check_pressed(vk_f5) {
    if !config_get("fullscreen") {
        window_set_rectangle(
            (display_get_width() - global.game_width) / 2,
            (display_get_height() - global.game_height) / 2,
            global.game_width,
            global.game_height,
        );
    }
}

// Mute music
if keyboard_check(vk_control) && keyboard_check_pressed(ord("M")) {
    if config_get("music_volume") > 0 {
        unmuted_music_volume = config_get("music_volume");
        config_set("music_volume", 0);
    }
    else {
        if unmuted_music_volume > 0 {
            config_set("music_volume", unmuted_music_volume);
        }
        else {
            config_set("music_volume", 25);
        }
    }
}

if is_in_game() {
    if input_check_pressed(key_restart) {
        save_load();
    }

    save_set_persistent("time", save_get("time") + 1 / room_speed);
}

update_window_caption();
render_update();
