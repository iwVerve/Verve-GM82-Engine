///option_fullscreen(type)

switch(argument0) {

    case "include":
        return true;

    case "in_pause":
        return true;

    case "step":
        if input_check_pressed(key_menu_accept) || input_check_pressed(key_menu_left) || input_check_pressed(key_menu_right) {
            config_set("fullscreen", !config_get("fullscreen"));
            window_set_fullscreen(config_get("fullscreen"));
            sound_play("player_ground_jump");
        }
        break;

    case "name":
        return "Display";

    case "value":
        return ternary(config_get("fullscreen"), "Fullscreen", "Windowed");

}
