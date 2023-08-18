///option_smoothing(type)

switch(argument0) {

    case "include":
        return true;

    case "in_pause":
        return true;

    case "step":
        if input_check_pressed(key_menu_accept) || input_check_pressed(key_menu_left) || input_check_pressed(key_menu_right) {
            config_set("smoothing", !config_get("smoothing"));
            sound_play("player_ground_jump");
        }
        break;

    case "name":
        return "Smoothing";

    case "value":
        return ternary(config_get("smoothing"), "On", "Off");

}
