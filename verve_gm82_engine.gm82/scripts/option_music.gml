///option_music(type)

switch(argument0) {

    case "include":
        return true;

    case "in_pause":
        return true;

    case "step":
        if input_check_pressed(key_menu_accept) || input_check_pressed(key_menu_left) || input_check_pressed(key_menu_right) {
            config_set("music", !config_get("music"));
        }
        break;

    case "name":
        return "Music";

    case "value":
        return ternary(config_get("music"), "On", "Off");

}
