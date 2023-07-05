///event_world_step()

if keyboard_check_pressed(vk_escape) || global.close_button_pressed {
    if room == rTitle {
        game_end();
    }
    else {
        room_goto(rTitle);
        global.close_button_pressed = false;
    }
}

if keyboard_check_pressed(vk_f2) {
    room_goto(rTitle);
}

if keyboard_check_pressed(vk_f4) {
    config_set("fullscreen", !config_get("fullscreen"));
    window_set_fullscreen(config_get("fullscreen"));

    config_write();
}

if is_in_game() {
    if input_check_pressed(key_restart) {
        save_load();
    }

    save_set_persistent("time", save_get("time") + 1 / room_speed);
}

update_window_caption();
render_update();
