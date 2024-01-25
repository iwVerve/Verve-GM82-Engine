///game_hotkeys()

// Pause game
if !global.paused {
    // Load game
    if input_check_pressed(key_restart) && is_in_game() {
        save_load();
        exit; // Prevent wacky behavior when pausing and restarting on the same frame.
    }

    if input_check_pressed(key_pause) if is_in_game() {
        _pause_surf = surface_get("pause_surf", global.game_width, global.game_height);
        surface_copy(_pause_surf, 0, 0, application_surface);

        surface_set_target(_pause_surf);
            draw_set_blend_mode(bm_add);
                draw_set_color(c_black);
                draw_rectangle(0, 0, global.game_width, global.game_height, false);
            draw_set_blend_mode(bm_normal);
        surface_reset_target();

        instance_deactivate_all(true);
        instance_activate_object(core);
        instance_activate_object(__gm82dx9_controller);

        global.paused = true;
    }
}
else {
    if input_check_pressed(key_menu_options) {
        if !instance_exists(Options) {
            with(instance_create(0, 0, Options)) {
                visible = false;
            }
        }
        else {
            instance_destroy_id(Options);
        }
    }

    if input_check_pressed(key_pause) {
        instance_activate_all();
        instance_destroy_id(Options);
        global.paused = false;
    }
}

// Close game
if keyboard_check_pressed(vk_escape) || global.close_button_pressed {
    if room == rInit || room == rTitle {
        game_end();
    }
    else {
        restart_game();
        global.close_button_pressed = false;
    }
}

// Restart game
if keyboard_check_pressed(vk_f2) {
    restart_game();
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
            config_set("music_volume", 15);
        }
    }
    sound_set_music_volume(config_get("music_volume") / 100);
}
